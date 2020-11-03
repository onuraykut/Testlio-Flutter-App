import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/tools/gradientCard.dart';
import 'package:eslesmeapp/tools/kategoriBilgileri.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'testler.dart';


class KategoriBolumu extends StatefulWidget {
  @override
  _KategoriBolumuState createState() => _KategoriBolumuState();
}

class _KategoriBolumuState extends State<KategoriBolumu> {
  @override
  Widget build(BuildContext context) {
    return kategoriler();
  }

Widget kategoriler() {
    return appBarWithScaffold(kategoriTasarim(), GradientColors.Background1, "Kategoriler");
  }
  Widget kategoriTasarim() {
    return Container(
      /*decoration: BoxDecoration(
                  gradient: GradientColors.Background1,
                ),*/
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: kategoriIsmi.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return kategoriView(
                context,
                kategoriIsmi[index],
                kategoriImageURL[index],
                index,
              );
            }),
      ),
    );
  }
  Widget kategoriView(
    BuildContext context,
    String kategoriIsim,
    String kategoriImage,
    int index,
  ) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Testler(kategori: kategoriIsim)));
      },
      child: GradientCard(
        margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
        gradient: renkler[index].gradient,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                kategoriIsim,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'roboto',
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  kategoriImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
