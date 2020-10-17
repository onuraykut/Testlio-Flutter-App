import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:flutter/material.dart';

class GonderiSecimi extends StatelessWidget {

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaylasmaBolumu()));
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

}
