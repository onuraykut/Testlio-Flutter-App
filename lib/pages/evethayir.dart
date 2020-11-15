import 'package:carousel_slider/carousel_slider.dart';
import 'package:eslesmeapp/blocs/TestBloc/bloc.dart';
import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/data/paylasim_repository.dart';
import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/model/paylasimKaydet.dart';
import 'package:eslesmeapp/model/sorular.dart';
import 'package:eslesmeapp/model/test.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:eslesmeapp/tools/domain.dart';
import 'package:eslesmeapp/tools/progressDialog.dart';
import 'package:eslesmeapp/widgets/CardDesingTests.dart';
import 'package:eslesmeapp/widgets/appbar.dart';
import 'package:eslesmeapp/widgets/springySlider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EvetHayirBolumu extends StatefulWidget {
  String id;
  String testPaylasimId;
  EvetHayirBolumu({@required this.id, this.testPaylasimId});

  @override
  _EvetHayirBolumuState createState() => _EvetHayirBolumuState();
}

class _EvetHayirBolumuState extends State<EvetHayirBolumu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  int _current = 0;
  int soruNo = 0;
  double rating = 50;
  List<int> siklar = new List<int>(20);
  List<Border> border = new List<Border>(20);
  double heightMedia;
  double widthMedia;
  List<double> animatedContainerSize = new List<double>(2);
  CarouselSlider carouselSlider;
  Test test;
  ProgressDialog pr;
  TestBloc _testBloc;
  bool isLoaded = false;
  String testAd;
  @override
  void initState() {

    animatedContainerSize[0] = 100.0;
    animatedContainerSize[1] = 100.0;

    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = ColorTween(begin: Colors.white, end: Colors.lightBlueAccent)
        .animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    _controller.addStatusListener(
      (durum) {
        if (durum == AnimationStatus.completed) {
          _controller.reverse().orCancel;
        } else if (durum == AnimationStatus.dismissed) {
          _controller.forward().orCancel; //sonsuza kadar devam edebilir.
        }
      },
    );
    _testBloc = BlocProvider.of<TestBloc>(context);
    _testBloc.add(FetchTestFromIdEvent(widget.id));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    heightMedia = MediaQuery.of(context).size.height;
    widthMedia = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: BlocBuilder<TestBloc, TestState>(
          bloc: _testBloc,
          builder: (context, TestState state) {
            if (state is TestUninitialized) {
              return Text("UNINIT");
            } else if (state is TestLoading) {
              return new Center(
                child: new CircularProgressIndicator(),
              );
            } else if (state is TestLoaded) {
              test = state.test;

              if (!isLoaded) {
                // test = state.test;
                siklar = new List<int>(state.test.sorular.length);
                border = new List<Border>(state.test.sorular.length);
                isLoaded = true;
               }
              return Scaffold(
                appBar: AppBar(
                  title: SizedBox(
                    height: heightMedia * 0.03,
                    width: widthMedia * 0.8,
                    child: Center(
                      child: Marquee(
                        text: state.test.testAdi ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        velocity: 35.0,
                        startPadding: 20.0,
                        blankSpace: 20.0,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                backgroundColor: animation.value,
                body: Container(
                  child: testevethayirBolumu(),
                ),
              );
//              return Container();
            } else if (state is TestError) {
              return Text("İnternet yok amk");
            } else {
              return Text("state");
            }
          }),
    );
  }

  Widget testevethayirBolumu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
    soruWidget(),
        test != null
            ? soruSecimleri(test.sorular[soruNo].soruTipi)
            : Container(),
        bitir_buton(),
      ],
    );
  }

  Widget soruSecimleri(int index) {
    switch (index) {
      case 0:
        return evetHayirTasarim();
        break;
      case 1:
        return abcdSiklari();
        break;
      case 2:
        return sliderTasarim();
        break;
    }
  }

  Widget soruWidget() {
    List<String> soruAdi = new List<String>();
    for (Sorular sorular in test.sorular) {
      soruAdi.add(sorular.soru);
    }
    carouselSlider = cardDesingTests(
        testVeSorular: soruAdi,
        pageChanged: (index) {
          onPageChanged(index);
        });

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          carouselSlider,
          ileriGeriButtons(),
        ]);
  }

  Function onPageChanged(int index) {
    setState(() {
//          this.soruNo = soru_tipler[index];
      soruNo = index;
      animatedContainerSize[0] = 100.0;
      animatedContainerSize[1] = 100.0;

      for (int i = 0; i < border.length; i++) {
        border[i] = null;
      }

      if (siklar[index] != null) {
        if (test.sorular[index].soruTipi == 0)
          animatedContainerSize[siklar[index]] = 150.0;
        if (test.sorular[index].soruTipi == 1)
          border[siklar[index]] = Border.all(width: 5);
      }
    });
  }

  Widget sliderTasarim() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            color: siklar[soruNo] == null ? Colors.indigo : Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            "${siklar[soruNo] != null ? siklar[soruNo].toInt() : 50}",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Slider(
          value: siklar[soruNo] != null ? siklar[soruNo].toDouble() : 50.0,
          min: 0,
          max: 100,
          //label: "${rating.toInt()}",
          activeColor: Colors.pink,
          divisions: 100,
          inactiveColor: Colors.white,
          onChanged: (newRating) {
            setState(() {
              siklar[soruNo] = newRating.toInt();
            });
          },
        ),
      ],
    );
  }

  Widget abcdSiklari() {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.white.withOpacity(0.0),
            child: InkWell(
              onTap: () => {
                this.setState(() {
                  siklar[soruNo] = index;

                  for (int i = 0; i < border.length; i++) {
                    if (i != index) border[i] = null;
                  }
                  border[index] = Border.all(width: 5);
                  carouselSlider.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                  /* Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      border[index] = null;
                    });
                  });*/
                })
              },
              child: Container(
                height: heightMedia * 0.075,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  /* gradient: renkler[index + 12].gradient, */
                  gradient: GradientColors.greenbeach,
                  borderRadius: BorderRadius.circular(15.0),
                  border: /*border[soruNo] == null ? null : Border.all(width: 5) ,*/ border[
                      index],
                ),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                  test.sorular[soruNo].siklar[index],
                  style: TextStyle(color: Colors.white),
                ),
                    )),
              ),
            ),
          );
        });
  }

  Widget evetHayirTasarim() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              siklar[soruNo] = 0;
              animatedContainerSize[0] = 150.0;
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() {
                animatedContainerSize[0] = 100.0;
              });
            });

            carouselSlider.nextPage(
                duration: Duration(milliseconds: 600), curve: Curves.linear);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: animatedContainerSize[0],
            width: animatedContainerSize[0],
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //       border: border[0],
              image: DecorationImage(
                image: AssetImage("assets/digericonlar/evet.png"),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              siklar[soruNo] = 1;
              animatedContainerSize[1] = 150;
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() {
                animatedContainerSize[1] = 100;
              });
            });

            carouselSlider.nextPage(
                duration: Duration(milliseconds: 600), curve: Curves.linear);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: animatedContainerSize[1],
            width: animatedContainerSize[1],
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/digericonlar/hayir.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bitir_buton() {
    int sum = 0;

      for(int i=0;i<test.sorular.length;i++) {
        if ( siklar[i] != null) sum += 1;
      }

    bool hasNull = false;
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ButtonTheme(
          height: 25.0,
          child: FlatButton(
            onPressed: () => {
             /* siklar.forEach((element) {
                if (test.sorular.length element == null) hasNull = true;
              }),*/

              for(int i=0;i<test.sorular.length; i++){
              if (siklar[i] == null ) hasNull = true,
        },

              if (hasNull) showEmptyDialog() else showBitirmeDialog()
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: sum == test.sorular.length? Colors.green : Colors.red,
            child: Row(
              // Replace with a Row for horizontal icon + text
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 6),
                  child: Icon(
                    Icons.done,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
          Text(
            "Bitir"+" "+sum.toString()+"/"+test.sorular.length.toString(),
            style: TextStyle(fontSize: 11,color: Colors.white),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  showEmptyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Tüm cevapları işaretleyiniz!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showBitirmeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Testi bitirmek istiyor musunuz?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () {
                widget.testPaylasimId == null
                    ? _dataKaydet()
                    : _dataKaydetExist();
              },
            ),
          ],
        );
      },
    );
  }

  Widget ileriGeriButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Flexible(
        child: InkWell(
          onTap: () {
            carouselSlider.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.050,
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/digericonlar/onceki.png"),
              ),
            ),
          ),
        ),
      ),
      Flexible(
        child: InkWell(
          onTap: () {
//                  setState(() {
//                    index++;
//                  });
            carouselSlider.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.050,
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/digericonlar/sonraki.png"),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  //Çözülen testin kaydedileceği yer
  Future<void> _dataKaydet() async {
    // siklar.removeWhere((value) => value == null);

    Navigator.of(context).pop();
    UserRepository userRepository =
        Provider.of<UserRepository>(context, listen: false);

    PaylasimKaydet paylasim = new PaylasimKaydet(
        testId: widget.id,
        testAdi: test.testAdi,
        paylasanUid: userRepository.user.uid,
        paylasanCevaplari: siklar);
    debugPrint(paylasim.toString());
    pr = progressDialog(context);
    await pr.show();
    var response = await http.post(Domain().getDomainApi() + "/room/save",
        headers: {"Content-type": "application/json"},
        body: paylasim.toRawJson());
    if (response.statusCode == 200) {
      debugPrint("dataKaydet=" + response.body);
      pr.hide().then((isHidden) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PaylasmaBolumu(
                  roomUrl: response.body,
                )));

      });
    } else {
      debugPrint(response.statusCode.toString());
    }
  }

  void _dataKaydetExist() async {
    // siklar.removeWhere((value) => value == null);

    ProgressDialog pr = progressDialog(context);
    await pr.show();
    new PaylasimRepository()
        .dataKaydetExist(widget.testPaylasimId, siklar)
        .then((value) => {
              pr.hide().then((isHidden) {
//        Navigator.pushReplacementNamed(context, '/PaylasmaBolumu',arguments: widget.testPaylasimId);
                debugPrint("value:" + value.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Springy(value)));
              })
            });
  }


  Future<String> _createDynamicLink(bool short,String testId,String roomId) async {

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://eslesmeapp.page.link',
      link: Uri.parse('https://eslesmeapp.page.link/${testId}-${roomId}'),
      androidParameters: AndroidParameters(
        packageName: 'com.brothers.eslesmeapp',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.google.FirebaseCppDynamicLinksTestApp.dev',
        minimumVersion: '0',
      ),
    );
    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }
    return url.toString();
  }

}
