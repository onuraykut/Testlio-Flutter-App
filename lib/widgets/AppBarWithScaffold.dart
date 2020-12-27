import 'package:eslesmeapp/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
      appBar: appBarTasarim2(
        title: title,
      ),
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

Widget appBarWithScaffoldMain(
    Widget safeAreaWidget, LinearGradient color, String title,
    context) {
  return Container(
    decoration: BoxDecoration(
      gradient: color,
    ),
    child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: appBarMain(
        title: title,
        context: context,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            //appbar'ın arka planı için hazır yapı
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 200,
              color: Colors.white70,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset('assets/graphics/logo.png',height: 200,),
                safeAreaWidget,
              ],
            ),
          ),
        ],
      ),
    ),
  );
}