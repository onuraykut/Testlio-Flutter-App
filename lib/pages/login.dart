import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/widgets/appbar.dart';
import 'package:eslesmeapp/widgets/facebook_button.dart';
import 'package:eslesmeapp/widgets/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: appBarTasarim2(title: 'Login'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFacebookButton(),
            _buildGoogleButton(),
            _buildAnonymousButton(),
            Visibility(
              visible: progressVisible,
              child: new CircularProgressIndicator(),
            ),
          ],
        ),
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
    return GoogleSignInButton(
      onPressed: () => {
        //  widget?.onGoogleClick(),
      },
    );
  }

  Widget _buildAnonymousButton() {
    bool isSignIn = false;
    return GoogleSignInButton(
      logoEnable: false,
      text: 'Anonim Giriş Yap',
      onPressed: () async => {
        _showProgress(true),
        isSignIn = await userRepo.signInAnonymous(),
        if (isSignIn) _showProgress(false),
        //  widget?.onGoogleClick(),
      },
    );
  }

  void _showProgress(bool isShow) {
    setState(() {
      progressVisible = isShow;
    });
  }
}
