import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/widgets/appbar.dart';
import 'package:eslesmeapp/widgets/facebook_button.dart';
import 'package:eslesmeapp/widgets/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'gonderiSecimi.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  UserRepository userRepo;

  var progressVisible = false;

  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);

    return Scaffold(
      key: _scaffoldkey,
      body: _buildPageContent(),
    );
  }

  Widget _buildPageContent() {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            child: Image.asset(
              "assets/kategoriresimler/Eglence.png",
            ),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildLoginForm(),
        ],
      ),
    );
  }

  Container _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 90.0,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFacebookButton(),
                        SizedBox(
                          height: 20,
                        ),
                        _buildGoogleButton(),
                        SizedBox(
                          height: 20,
                        ),
                        _buildAnonymousButton(),
                        Visibility(
                          visible: progressVisible,
                          child: new CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacebookButton() {
    return FacebookSignInButton(
      onPressed: () => {
        // widget?.onFacebookClick(),
      },
    );
  }

  Widget _buildGoogleButton() {
    User user;
    return GoogleSignInButton(
      darkMode: true,
      onPressed: () async => {
        _showProgress(true),
        userRepo.googleSignInFunc().then((result) => {
              if (result != null) {
                _showProgress(false),
                sonrakiSayfa(),
              }
        })
      },
    );
  }

  Widget _buildAnonymousButton() {
    bool isSignIn = false;
    return GoogleSignInButton(
      logoEnable: false,
      darkMode: true,
      text: 'Anonim Giriş Yap',
      onPressed: () async => {
        _showProgress(true),
        isSignIn = await userRepo.signInAnonymous(),
        if (isSignIn) {
          _showProgress(false),
          sonrakiSayfa(),
        }
        //  widget?.onGoogleClick(),
      },
    );
  }

  void sonrakiSayfa() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GonderiSecimi();
        },
      ),
    );
  }
  void _showProgress(bool isShow) {
    setState(() {
      progressVisible = isShow;
    });
  }

  void _showDialogDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Test paylaşımını silmek istediğinden emin misin?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
                //Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
