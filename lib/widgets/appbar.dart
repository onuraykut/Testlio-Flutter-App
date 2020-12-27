import 'package:eslesmeapp/pages/notificationPage.dart';
import 'package:eslesmeapp/pages/settings.dart';
import 'package:flutter/material.dart';

Widget appBarTasarim(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    flexibleSpace: Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF1CD4D1),
              const Color(0xFF1CD4D1),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    ),
  );
}

Widget appBarTasarim2({@required String title, context}) {
  return AppBar(
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

Widget appBarMain({@required String title, context}) {
  return AppBar(
    backgroundColor: Colors.deepPurple,
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
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NotificationPage()));
          },
          child: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Settings()));
          },
          child: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ),
    ],
    iconTheme: IconThemeData(color: Colors.white),
  );
}
