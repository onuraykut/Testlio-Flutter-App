import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:eslesmeapp/pages/settings.dart';
import 'package:eslesmeapp/pages/sharedWithMe.dart';
import 'package:eslesmeapp/tools/deeplink.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cozdugumTestler.dart';
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
    // return appBarWithScaffold(_buildBody(context), GradientColors.Background1, "Uygulamanın Adı");
    return Scaffold(
      backgroundColor: Color(0xff6DC8F3),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: GradientColors.Background5,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              InkWell(
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 250,
                            child: Text(
                              "Eşleşme App",
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget gonderiSecimiTasarim(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KategoriBolumu()));
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
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaylasmaBolumu()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CozdugumTestler()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
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
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaylasmaBolumu()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CozdugumTestler()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.all(15),
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
          ),
        ),
        /*Expanded(
            child: InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PaylasmaBolumu()));
                Navigator.push(context, MaterialPageRoute(builder: (context) => CozdugumTestler()));

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
          ),*/
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KategoriBolumu()));
                    },
                    child: Container(
                      height: 190,
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Testler",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.question,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Steps',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SharedWithMe()));
                    },
                    child: Container(
                      height: 120,
                      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Çözdüklerim",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.percentage,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Avg. Heart Rate',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CozdugumTestler()));
                    },
                    child: Container(
                      height: 120,
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Paylaştıklarım",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              FontAwesomeIcons.slideshare,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 190,
                    color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "15 kms",
                            style:
                                Theme.of(context).textTheme.display1.copyWith(
                                      fontSize: 24.0,
                                      color: Colors.black,
                                    ),
                          ),
                          trailing: Icon(
                            Icons.adb,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Distance',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
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

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
