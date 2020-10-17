import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class PaylasmaBolumu extends StatelessWidget {
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    String paylasimId = ModalRoute.of(context).settings.arguments;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bitir_buton(context),
            /*InkWell(onTap: (){
             *//* Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ArkadasListesiPaylasim(paylasimId)));
             showSearch(context: context, delegate: UserPaylasmaSearch(BlocProvider.of<UserSearchBloc>(context)));*//*

            },
                child: circleImages("arkilepaylas")),*/
            //InkWell(child: circleImages("KesfettePaylas")),
            InkWell(
              onTap: () {
                Share.share('https://google.com');
              },
              child: Row(
                children: <Widget>[
                  Container(
                    height: height * 0.25,
                    width: width * 0.33,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image:
                            new AssetImage('assets/digericonlar/facebook.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: height * 0.25,
                    width: width * 0.33,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image:
                            new AssetImage('assets/digericonlar/instagram.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: height * 0.25,
                    width: width * 0.33,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image:
                            new AssetImage('assets/digericonlar/whatsapp.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget bitir_buton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ButtonTheme(
          height: 25.0,
          child: FlatButton(
            onPressed: () => {
                Navigator.pushNamed(context, '/PaylasmaSonrasi'),
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.white,
            child: Row(
              // Replace with a Row for horizontal icon + text
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 6),
                  child: Icon(
                    Icons.navigate_next,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Devam et",
                  style: TextStyle(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget circleImages(String title) {
    return Container(
      height: height * 0.25,
      width: width * 0.4,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('assets/secimresimleri/$title.png'),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
