import 'dart:convert';

import 'package:eslesmeapp/model/cozenler.dart';
import 'package:eslesmeapp/tools/domain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SonucRepository {

  Future <List<Cozenler>> getTestResultByRoom(String roomId) async{
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var response =
    await http.post(Domain().getDomainApi() + "/room/getTestResultByRoom", body: {
      "roomId" : roomId,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Cozenler.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }
  }

}