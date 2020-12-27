import 'dart:io';

import 'package:eslesmeapp/tools/domain.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

enum UserDurumu {Idle,OturumAcilmamis,OturumAciliyor,OturumAcik}

class UserRepository with ChangeNotifier {

  FirebaseAuth _auth;
  User _user;
  UserDurumu _durum = UserDurumu.Idle;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  UserRepository(){
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }



  User get user => _user;

  set user(User value) {
    _user = value;
  }

  UserDurumu get durum => _durum;

  set durum(UserDurumu value) {
    _durum = value;
  }

  Future<User> signInAnonymous() async{
    try{
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();
      UserCredential userCredential = await _auth.signInAnonymously();
      String name = 'Anonim';
      await saveUser(userCredential.user.uid,name);

      return userCredential.user;
    }catch(e){
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      debugPrint(e.toString());
      return null;
    }
  }

  Future<User> googleSignInFunc() async{
    try{
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final User currentUser = _auth.currentUser;
        assert(user.uid == currentUser.uid);
        print('signInWithGoogle succeeded: $user');
        await saveUser(currentUser.uid,currentUser.displayName ?? "Anonim");
        return user;
      }

      return null;
    }catch(e){
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      return null;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _durum = UserDurumu.OturumAcilmamis;
    notifyListeners();
    debugPrint('Cikis yapildi');
    return Future.delayed(Duration.zero);
  }
  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  Future <void> saveUser(String uid,String name) async{
    debugPrint(uid+'---'+name);
    if (Platform.isIOS) iOS_Permission();
    String token = await _firebaseMessaging.getToken();
    print('token: '+token);

    var response =
    await http.post(Domain().getDomainApi() + "/user/save", body: {
      "uid": uid,
      "name": name,
      "token": token,
    });
    debugPrint(response.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future<void> _onAuthStateChanged(User user) async{
      if(user == null) {
        _durum = UserDurumu.OturumAcilmamis;
      } else {
        _user = user;
        debugPrint(_user.uid);
        _durum = UserDurumu.OturumAcik;
      }

      notifyListeners();
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }
}