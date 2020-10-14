import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

enum UserDurumu {Idle,OturumAcilmamis,OturumAciliyor,OturumAcik}

class UserRepository with ChangeNotifier {

  FirebaseAuth _auth;
  User _user;
  UserDurumu _durum = UserDurumu.Idle;
  
  UserRepository(){
    _auth = FirebaseAuth.instance;
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

  Future<bool> signInAnonymous() async{
    try{
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();
      UserCredential userCredential = await _auth.signInAnonymously();
      return true;
    }catch(e){
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _durum = UserDurumu.OturumAcilmamis;
    notifyListeners();
    debugPrint('Cikis yapildi');
    return Future.delayed(Duration.zero);
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


}