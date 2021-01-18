import 'package:eslesmeapp/blocs/TestBloc/test_bloc.dart';
import 'package:eslesmeapp/blocs/locator.dart';
import 'package:eslesmeapp/colors/gradientcolor.dart';
import 'package:eslesmeapp/pages/kategoriler.dart';
import 'package:eslesmeapp/pages/paylasmabolumu.dart';
import 'package:eslesmeapp/pages/settings.dart';
import 'package:eslesmeapp/pages/sharedWithMe.dart';
import 'package:eslesmeapp/pages/sorusecme_hazirlama.dart';
import 'package:eslesmeapp/tools/PushNotificationService.dart';
import 'package:eslesmeapp/tools/deeplink.dart';
import 'package:eslesmeapp/widgets/AppBarWithScaffold.dart';
import 'package:eslesmeapp/widgets/anasayfaUiScreen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cozdugumTestler.dart';
import 'evethayir.dart';
import 'notificationPage.dart';

class GonderiSecimi extends StatefulWidget {
  @override
  _GonderiSecimiState createState() => _GonderiSecimiState();
}

class _GonderiSecimiState extends State<GonderiSecimi> {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();
  double width;
  double height;

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
    handleStartUpLogic();
  }

  Future handleStartUpLogic() async {
    await _pushNotificationService.initialise();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // return appBarWithScaffold(_buildBody(context), GradientColors.Background1, "Uygulamanın Adı");
    return appBarWithScaffoldMain(GridDashboard(), GradientColors.endsunset, "Testlio",context);
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
        padding: EdgeInsets.all(width * 0.05),
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
                      height: height * 0.25,
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Testler",
                              style:
                                  TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.question,
                              color: Colors.white,
                            ),
                          ),
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
                      padding: EdgeInsets.all(10),
                      height: height * 0.15,
                      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Çözdüklerim",
                            style:
                            TextStyle(
                                      color: Colors.white,
                                      fontSize: 21.0,
                                    ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                FontAwesomeIcons.percentage,
                                color: Colors.white,
                              ),
                            ],
                          ),
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
                      padding: EdgeInsets.all(10),
                      height: height * 0.15,
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Paylaştıklarım",
                            style:
                                Theme.of(context).textTheme.display1.copyWith(
                                      color: Colors.white,
                                      fontSize: 21.0,
                                    ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                FontAwesomeIcons.slideshare,
                                color: Colors.white,
                              ),
                            ],
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
                              builder: (context) => SoruHazirlama()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: height * 0.25,
                      color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Soru Hazırlama",
                            style:
                                Theme.of(context).textTheme.display1.copyWith(
                                      fontSize: 21.0,
                                      color: Colors.black,
                                    ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                FontAwesomeIcons.gratipay,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          /* Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Distance',
                            ),
                          )*/
                        ],
                      ),
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
              builder: (context) => BlocProvider(
                create: (BuildContext context) => TestBloc(),
                child: EvetHayirBolumu(
                  id: sonuc[0],
                  testPaylasimId: sonuc[1],
                ),
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
            builder: (context) => BlocProvider(
              create: (BuildContext context) => TestBloc(),
              child: EvetHayirBolumu(
                id: sonuc[0],
                testPaylasimId: sonuc[1],
              ),
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
