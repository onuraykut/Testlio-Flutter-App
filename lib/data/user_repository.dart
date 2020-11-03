import 'package:eslesmeapp/tools/domain.dart';
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

  Future<bool> signInAnonymous() async{
    try{
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();
      UserCredential userCredential = await _auth.signInAnonymously();
      await saveUser(userCredential.user.uid,userCredential.user.displayName ?? "Anonim");

      return true;
    }catch(e){
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      return false;
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
    var response =
    await http.post(Domain().getDomainApi() + "/user/save", body: {
      "uid": uid,
      "name": name,
    });
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


}