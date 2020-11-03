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
