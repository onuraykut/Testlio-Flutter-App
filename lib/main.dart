import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/pages/gonderiSecimi.dart';
import 'package:eslesmeapp/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/TestBloc/test_bloc.dart';
import 'blocs/locator.dart';
import 'tools/firebaseauth_provider.dart';

//TODO
// 1- Kullanıcı Adı Belirleme Sayfası
// 2- Sonuç Ekranı
// 3- Veritabanı oluşturması
// 4- DeepLink ayarlanması
// 5- Paylaşma Ekranı tuşların aktif edilmesi(whatsapp,facebook..vs)

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<TestBloc>(
            create: (BuildContext context) => TestBloc(),
          ),
        ],
        child: ChangeNotifierProvider<UserRepository>(
    create: (context) => UserRepository(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProviderwithFirebaseAuth() /*GonderiSecimi()*/,
    ),
  ),
      ));
}
