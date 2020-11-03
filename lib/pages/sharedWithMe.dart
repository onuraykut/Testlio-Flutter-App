import 'package:eslesmeapp/blocs/CozdugumTestlerBloc/bloc.dart';
import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/data/cozdugumTestler_repository.dart';
import 'package:eslesmeapp/pages/sonuclar.dart';
import 'package:eslesmeapp/tools/gradientCard.dart';
import 'package:eslesmeapp/tools/kategoriBilgileri.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'evethayir.dart';

enum MenuItems { gizle, sil, paylas }

class SharedWithMe extends StatefulWidget {
  @override
  _SharedWithMeState createState() => _SharedWithMeState();
}

class _SharedWithMeState extends State<SharedWithMe> {
  final menuItems = ['Gizlediklerimi  göster', 'Gizlediklerimi kapat'];
  final titles = ['Paylaştıklarım', 'Gizlediklerim'];
  final testBulunmuyor = [
    'Paylaştığınız test bulunmuyor',
    'Gizlediğiniz test bulunmuyor'
  ];
  int whichTitle = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //String _selection;
  MenuItems _selection;
  String dropdownValue = '1';
  var _testBloc;
  List<String> spinnerItems = ["1", "2", "3"];

  @override
  void initState() {
    super.initState();
    _testBloc = BlocProvider.of<CozdugumTestlerBloc>(context);
    _testBloc.add(FetchSharedWithMeEvent());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return appBarWithScaffold(testlerTasarim(width, height),
        GradientColors.Background1, titles[whichTitle],
        scaffoldKey: _scaffoldKey);
  }

  Widget testlerTasarim(double width, double height) {
    double cardHeight = height * 0.15;
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Expanded(
          child: BlocBuilder<CozdugumTestlerBloc, TestState>(
              bloc: _testBloc,
              builder: (context, TestState state) {
                if (state is TestUninitialized) {
                  return Text("UNINIT");
                } else if (state is TestLoading) {
                  return new Center(
                    child: new CircularProgressIndicator(),
                  );
                } else if (state is TestLoaded) {
                  if (state.rooms.length == 0) {
                    return Center(
                      child: Text(
                        testBulunmuyor[whichTitle],
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.rooms == null ? 0 : state.rooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                        /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sonuclar()));*/
                        },
                        child: Container(
                          height: cardHeight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: GradientCard(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
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
                                  state.rooms[index].testAdi,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Çözen sayısı: " +
                                        state.rooms[index].cozenSayisi
                                            .toString(),
//                                     5.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                trailing: popUp(state.rooms[index].id),
                              ),
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

  Widget popUp(String roomId) {
    return PopupMenuButton<MenuItems>(
      elevation: 4,
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      onSelected: (MenuItems result) {
        setState(() {
          // _selection = result;
          if (result == MenuItems.sil)
            _showDialogDelete(roomId);
          else if (result == MenuItems.gizle) _showDialogHide(roomId);
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
        const PopupMenuItem<MenuItems>(
          value: MenuItems.gizle,
          child: Text("Gizle",
              style: TextStyle(
                fontSize: 15,
              )),
        ),
        const PopupMenuItem<MenuItems>(
          value: MenuItems.sil,
          child: Text("Sil",
              style: TextStyle(
                fontSize: 15,
              )),
        ),
        const PopupMenuItem<MenuItems>(
          value: MenuItems.paylas,
          child: Text("Paylaş",
              style: TextStyle(
                fontSize: 15,
              )),
        ),
      ],
    );
  }

  Widget appBarCozduklerim({@required String title, context}) {
    return AppBar(
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (_) => <PopupMenuItem<String>>[
            new PopupMenuItem<String>(
              value: menuItems[whichTitle],
              child: Text(menuItems[whichTitle]),
            ),
          ],
          /* return menuItems[0].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();*/
        ),
      ],
      backgroundColor: Colors.indigo,
      title: Text(
        title == null ? "" : title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  void handleClick(String value) {
    if (value == menuItems[0]) {
      setState(() {
        whichTitle = 1;
      });
      _testBloc.add(FetchGizlediklerimEvent());
    } else if (value == menuItems[1]) {
      setState(() {
        whichTitle = 0;
      });
      _testBloc.add(FetchAllEvent());
    }
  }

  Widget appBarWithScaffold(
      Widget safeAreaWidget, LinearGradient color, String title,
      {GlobalKey scaffoldKey}) {
    return Container(
      decoration: BoxDecoration(
        gradient: color,
      ),
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: appBarCozduklerim(title: title),
        body: Stack(
          children: <Widget>[
            ClipPath(
              //appbar'ın arka planı için hazır yapı
              clipper: DiagonalPathClipperOne(),
              child: Container(
                height: 200,
                color: Colors.indigoAccent,
              ),
            ),
            SafeArea(
              child: safeAreaWidget,
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogDelete(String roomId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Test paylaşımını silmek istediğinden emin misin?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
                //Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () {
                new CozdugumRepository().deleteRoom(roomId);
                Navigator.of(context).pop();

                _scaffoldKey.currentState.showSnackBar(
                  const SnackBar(content: Text('Silindi')),
                );
                _testBloc.add(FetchAllEvent());
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogHide(String roomId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Test paylaşımını gizlemek istediğinden emin misin?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
                //Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () async {
                await new CozdugumRepository().hideRoom(roomId, true);
                Navigator.of(context).pop();

                _scaffoldKey.currentState.showSnackBar(
                  const SnackBar(content: Text('Gizlendi')),
                );
                _testBloc.add(FetchAllEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
