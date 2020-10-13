import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:flutter/material.dart';

class GonderiSecimi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // GERİ DÖNÜŞ KOYULACAK RENK AYARLANACAK
            ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KategoriBolumu()));
                  debugPrint("asda");
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
        ),
      );
  }

 /*  NextPage() {
    final String value ;

    AnaSayfa({Key key , this.value}) : super (key : key ) ;

  } */

}
