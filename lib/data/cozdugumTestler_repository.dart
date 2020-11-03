import 'dart:convert';

import 'package:eslesmeapp/model/room.dart';
import 'package:eslesmeapp/model/test.dart';
import 'package:eslesmeapp/tools/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CozdugumRepository {

  FirebaseAuth _auth;
  User _user;

  CozdugumRepository() {
    _auth = FirebaseAuth.instance;
  }

  Future <Room> getTestFromId(String id) async{
    var response =
    await http.post(Domain().getDomainApi() + "/test/id", body: {
      "id": id,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return Room.fromRawJson((response.body));
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future <List<Room>> getCozdugumTestler() async{
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var response =
    await http.post(Domain().getDomainApi() + "/room/cozduklerim", body: {
      "uid" : _auth.currentUser.uid,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Room.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future<void> deleteRoom(String roomId) async{
    var response =
    await http.post(Domain().getDomainApi() + "/room/delete", body: {
      "roomId": roomId,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future<void> hideRoom(String roomId,bool hide) async{
    var response =
    await http.post(Domain().getDomainApi() + "/room/hide", body: {
      "uid": _auth.currentUser.uid,
      "roomId": roomId,
      "hide": hide.toString(),
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future <List<Room>> getGizlediklerimTestler() async{
    var response =
    await http.post(Domain().getDomainApi() + "/room/gizlediklerim", body: {
      "uid" : _auth.currentUser.uid,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Room.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future <List<Room>> getSharedWithMeTestler() async{
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var response =
    await http.post(Domain().getDomainApi() + "/room/sharedWithMe", body: {
      "uid" : _auth.currentUser.uid,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Room.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }
  }
}