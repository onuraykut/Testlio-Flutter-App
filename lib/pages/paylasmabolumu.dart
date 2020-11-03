import 'package:eslesmeapp/pages/evethayir.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class PaylasmaBolumu extends StatefulWidget {
  String roomId;
  String testId;
  PaylasmaBolumu({this.roomId, this.testId});

  @override
  _PaylasmaBolumuState createState() => _PaylasmaBolumuState();
}

class _PaylasmaBolumuState extends State<PaylasmaBolumu> {
  double width;

  double height;


  String _linkMessage;
  String url2;
  bool _isCreatingLink = false;
  Uri url;

  @override
  void initState() {
    super.initState();
     initDynamicLinks();
    createUrl();

  }

  @override
  Widget build(BuildContext context) {
    String paylasimId = ModalRoute.of(context).settings.arguments;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bitir_buton(context),
            SizedBox(height: 30,),
            /*InkWell(onTap: (){
             */ /* Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ArkadasListesiPaylasim(paylasimId)));
             showSearch(context: context, delegate: UserPaylasmaSearch(BlocProvider.of<UserSearchBloc>(context)));*/ /*

            },
                child: circleImages("arkilepaylas")),*/
            //InkWell(child: circleImages("KesfettePaylas")),
            Text('Arkadaşlarınla Paylaş',style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
            InkWell(
              onTap: () {
                Share.share('https://google.com');
              },
              child: Row(
                children: <Widget>[
                  Container(
                    height: height * 0.25,
                    width: width * 0.33,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image:
                            new AssetImage('assets/digericonlar/facebook.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: height * 0.25,
                    width: width * 0.33,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image:
                            new AssetImage('assets/digericonlar/instagram.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: height * 0.25,
                    width: width * 0.33,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image:
                            new AssetImage('assets/digericonlar/whatsapp.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            SelectableText(url2 ?? 'Link oluşturuluyor...'),
          ],
        ),
      ),
    );
  }
  void createUrl() async {
    String url3 = await _createDynamicLink(true);

    setState(()  {
      url2 = url3;
    });
  }
  Widget bitir_buton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ButtonTheme(
          height: 25.0,
          child: FlatButton(
            onPressed: () => {
            Navigator.of(context).popUntil((route) => route.isFirst),
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.white,
            child: Row(
              // Replace with a Row for horizontal icon + text
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 6),
                  child: Icon(
                    Icons.navigate_next,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Devam et",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget circleImages(String title) {
    return Container(
      height: height * 0.25,
      width: width * 0.4,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('assets/secimresimleri/$title.png'),
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        String path = deepLink.path.substring(1);
        var sonuc = path.split("-");
        // Navigator.pushNamed(context, deepLink.path);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EvetHayirBolumu(
                id: sonuc[0],
                testPaylasimId: sonuc[1],
              ),
            ));
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      String path = deepLink.path.substring(1);
      var sonuc = path.split("-");
      //  Navigator.pushNamed(context, deepLink.path,arguments: {deepLink.path});
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EvetHayirBolumu(
              id: sonuc[0],
              testPaylasimId: sonuc[1],
            ),
          ));
    }
  }

  Future<String> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://eslesmeapp.page.link',
      link: Uri.parse('https://eslesmeapp.page.link/${widget.testId}-${widget.roomId}'),
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

    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }
    _linkMessage = url.toString();
    _isCreatingLink = false;
    debugPrint(_linkMessage+"--"+ url.path);
    return url.toString();
  }
}
