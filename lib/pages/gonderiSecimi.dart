import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:eslesmeapp/tools/deeplink.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'evethayir.dart';

class GonderiSecimi extends StatefulWidget {

  @override
  _GonderiSecimiState createState() => _GonderiSecimiState();
}

class _GonderiSecimiState extends State<GonderiSecimi> {
@override
  void initState() {
  initDynamicLinks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return appBarWithScaffold(gonderiSecimiTasarim(context), GradientColors.Background1, "Uygulamanın Adı");
  }

    Widget gonderiSecimiTasarim(BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KategoriBolumu()));
              },
              child: Container(
                margin: EdgeInsets.all(25),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: AssetImage("assets/digericonlar/testresmi.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                  gradient: GradientColors.Background5,
                ),
                //child: Align(child: Text("TESTLER",style: TextStyle(fontSize: 25,color: Colors.white),),alignment: Alignment.bottomCenter,),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PaylasmaBolumu()));
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));

              },
              child: Container(
                margin: EdgeInsets.all(25),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: AssetImage("assets/digericonlar/sonuclar.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                  gradient: GradientColors.Background8,
                ),
                //child: Align(child: Text("SONUÇLAR",style: TextStyle(fontSize: 25,color: Colors.white),),alignment: Alignment.bottomCenter,),
              ),
            ),
          ),
        ],
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

}
