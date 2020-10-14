import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:flutter/material.dart';

class GonderiSecimi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return appBarWithScaffold(gonderiSecimiTasarim(context), GradientColors.Background1, "Seçim");
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
              child: Card(
                margin: EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/kategoriresimler/Aile.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                  ),
                  child: Text("TESTLER"),
                ),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaylasmaBolumu()));
              },
              child: Card(
                margin: EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage("assets/kategoriresimler/diger.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                  ),
                  child: Text("SONUÇLAR"),
                ),
              ),
            ),
          ),
        ],
      );
    }

}
