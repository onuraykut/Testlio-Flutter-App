import 'dart:io';

import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/pages/gonderiSecimi.dart';
import 'package:eslesmeapp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderwithFirebaseAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, UserRepository userRepo, child) {
        switch (userRepo.durum) {
          case UserDurumu.Idle:
            return SplashEkran();
          case UserDurumu.OturumAciliyor:
          case UserDurumu.OturumAcilmamis:
            return Login();
          case UserDurumu.OturumAcik:
            return GonderiSecimi();
        }
      });
  }
}

class SplashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Ekran"),
      ),
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}