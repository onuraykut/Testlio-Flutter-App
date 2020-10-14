import 'package:eslesmeapp/blocs/TestBloc/test_bloc.dart';
import 'package:eslesmeapp/blocs/TestBloc/test_event.dart';
import 'package:eslesmeapp/blocs/TestBloc/test_state.dart';
import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/tools/gradientCard.dart';
import 'package:eslesmeapp/tools/kategoriBilgileri.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WhyFarther { favoritest, sonracoz, paylas }

class Testler extends StatefulWidget {
  var kategori;
  Testler(this.kategori);

  @override
  _TestlerState createState() => _TestlerState();
}

class _TestlerState extends State<Testler> {
  //String _selection;
  WhyFarther _selection;
  String dropdownValue = '1';

  List<String> spinnerItems = ["1", "2", "3"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return appBarWithScaffold(testlerTasarim(width, height),
        GradientColors.Background1, widget.kategori);
  }

  Widget testlerTasarim(double width, double height) {
    final _testBloc = BlocProvider.of<TestBloc>(context);
    _testBloc.add(FetchKategoriEvent());
    double cardWidth = width * 0.2;
    double cardHeight = height * 0.15;
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Expanded(
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
                  return ListView.builder(
                    itemCount: state.Tests.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: cardHeight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: GradientCard(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          gradient: GradientColors.cardProfile,
                          child: Center(
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: width * 0.2,
                                  height: height * 0.08,
                                  child: Image.asset(kategoriImageURL[index],
                                      fit: BoxFit.contain),
                                ),
                              ),
                              title: Text(
                                state.Tests[index].testAdi,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
//                                      state.Tests[index].sorular.length.toString(),
                                  5.toString(),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              trailing: popUp(),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is TestError) {
                  return Text("Lütfen internete bağlanın");
                } else {
                  return Text("-");
                }
              }),
        ),
        Column(children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black, fontSize: 15),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropdownValue = data;
              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ]),
      ],
    );
  }

  Widget popUp() {
    return PopupMenuButton<WhyFarther>(
      elevation: 4,
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      onSelected: (WhyFarther result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.favoritest,
          child: Text("Favorilerime Ekle",
              style: TextStyle(
                fontSize: 15,
              )),
        ),
        /*const PopupMenuItem<WhyFarther>(
          value: WhyFarther.paylas,
          child: Text(
            "Paylaş",
            style: TextStyle(fontSize: 15),
          ),
        ),*/
      ],
    );
  }
}
