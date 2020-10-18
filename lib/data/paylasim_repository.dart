import 'dart:convert';

import 'package:eslesmeapp/tools/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class PaylasimRepository {

  Future<void> kisiylePaylas (List<String> uid,String paylasimId) async {
    var response =
    await http.post(Domain().getDomainApi() + "/paylasim/kisiylePaylas",
        headers: {"Content-type": "application/json"},
        body:  new KisiylePaylas(uid, paylasimId).toRawJson());
    if (response.statusCode == 200) {
//      debugPrint(response.body.toString());
      return;
    } else {
      debugPrint(response.statusCode.toString());
    }
  }

  Future<double> dataKaydetExist(String paylasimId,List<int> siklar) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User firebaseUser = await _auth.currentUser;

    var response = await http.post(Domain().getDomainApi() + "/room/cevapKaydet",
        headers: {"Content-type": "application/json"},
        body: new PaylasimExist(paylasimId,firebaseUser.uid,siklar).toRawJson());
    if (response.statusCode == 200) {
      debugPrint("res:::"+response.body);

      return double.parse(response.body);
    } else {
      debugPrint("error::"+response.statusCode.toString()+response.body.toString());
    }
  }
}

class KisiylePaylas {
  List<String> uid;
  String paylasimID;

  KisiylePaylas(this.uid, this.paylasimID);

  Map<String, dynamic> toJson() => {
    "uid":   List<dynamic>.from(uid.map((x) => x)),
    "paylasimID": paylasimID,
  };

  String toRawJson() => json.encode(toJson());

}

class PaylasimExist {
  String paylasimId;
  String uid;
  List<int> cevaplar;


  PaylasimExist(this.paylasimId, this.uid,this.cevaplar);

  Map<String, dynamic> toJson() => {
    "paylasimId": paylasimId,
    "uid": uid,
    "cevaplar": List<dynamic>.from(cevaplar.map((x) => x)),
  };

  String toRawJson() => json.encode(toJson());

}
