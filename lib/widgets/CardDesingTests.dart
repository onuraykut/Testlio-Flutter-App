import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eslesmeapp/widgets/CustomCardShapePainter.dart';
import 'package:flutter/material.dart';

CarouselSlider cardDesingTests({@required List<String> testVeSorular,Function onClick,Function pageChanged,double size,GlobalKey keyButton}) {

  return  CarouselSlider.builder(
    itemCount: testVeSorular.length,
    onPageChanged: (index) => pageChanged(index),
    aspectRatio: size == null ? 16/9 : size,
    itemBuilder: (BuildContext context, int itemIndex) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        key: keyButton,
        onTap: () {
          onClick != null ? onClick(itemIndex) : {};
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                    colors: [Color(0xff6DC8F3), Color(0xff73A1F9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff73A1F9),
                    blurRadius: 5,
                    //offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: CustomPaint(
                size: Size(100, 150),
                painter: CustomCardShapePainter(
                  12,
                  Color(0xff6DC8F3),
                  Color(0xff73A1F9),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: AutoSizeText(
                      testVeSorular[itemIndex],
                      style: TextStyle(color: Colors.white,fontFamily: 'Cantarell',fontSize: 17,fontWeight: FontWeight.bold),
                      maxLines: 7,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Text(
                        '${itemIndex + 1}/${testVeSorular.length}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


