import 'package:eslesmeapp/pages/gonderiSecimi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


//TODO
// 1- Kullanıcı Adı Belirleme Sayfası
// 2- Sonuç Ekranı
// 3- Veritabanı oluşturması
// 4- DeepLink ayarlanması
// 5- Paylaşma Ekranı tuşların aktif edilmesi(whatsapp,facebook..vs)


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GonderiSecimi(),
  ));
}


  void test() {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
  void signInAnonymously() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  }

