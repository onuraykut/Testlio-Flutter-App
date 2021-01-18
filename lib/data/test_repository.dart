import 'dart:convert';

import 'package:eslesmeapp/model/test.dart';
import 'package:eslesmeapp/tools/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestRepository {

  FirebaseAuth _auth;
  User _user;

  TestRepository() {
    _auth = FirebaseAuth.instance;
  }

  List <Test> getPopulerTest() {
    List<Test> testler = new List<Test>();
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Popüler???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test soasdsdrusudur 2 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test sorasdsadusudur 3 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test soruddsudur 4 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test sorucccsudur 5 ???'));
    return testler;
  }

  List <Test> getKategoriTest() {
    List<Test> testler = new List<Test>();
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Kategori??'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test axsx 2 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test xasaa 3 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test aaaa 4 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test xsdsd 5 ???'));
    return testler;
  }

  List <Test> getSonucTestler(String uid) {
    List<Test> testler = new List<Test>();
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Sonuçççç'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test axsx 2 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test xasaa 3 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test aaaa 4 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test xsdsd 5 ???'));
    return testler;
  }

  List <Test> getKesfetTestler() {
    List<Test> testler = new List<Test>();
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Keşfettt'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test axsx 2 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test xasaa 3 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test aaaa 4 ???'));
    testler.add(new Test(id: '123',olusturanUid: '124',olusturanTipi: 'Ekip',kategori: 'Aşk',olusturmaTarihi: "11111",testAdi: 'Bu bir test xsdsd 5 ???'));
    return testler;
  }

  Future <Test> getTestFromId(String id) async{
    var response =
    await http.post(Domain().getDomainApi() + "/test/id", body: {
      "id": id,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return testFromJson((response.body));
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future <List<Test>> getCozdugumTestler(int page) async{
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var response =
    await http.post(Domain().getDomainApi() + "/test/id", body: {
      "page" : page,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Test.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future <List<Test>> getTestsFromKategori(String kategori) async{
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var response =
    await http.post(Domain().getDomainApi() + "/test/kategori", body: {
      "kategori" : kategori,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
      String source = utf8.decode(response.bodyBytes);
      debugPrint(source);
      return (json.decode(source) as List)
          .map((tekGonderiMap) => Test.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.statusCode.toString());
      throw Exception('Failed to load post');
    }

  }

  Future <List<Test>> getTestlerim() async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    User firebaseUser = _auth.currentUser;
    debugPrint('uid:'+firebaseUser.uid);
    debugPrint('url: '+Domain().getDomainApi() + "/test/testlerim");
    var response =
    await http.post(Domain().getDomainApi() + "/test/testlerim", body: {
      "uid" : firebaseUser.uid,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
      String source = utf8.decode(response.bodyBytes);
      debugPrint(source);
      return (json.decode(source) as List)
          .map((tekGonderiMap) => Test.fromJson(tekGonderiMap))
          .toList();
    } else {
      debugPrint(response.body);
      throw Exception('Failed to load post');
    }

  }

  void deleteTest(String testId) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    User firebaseUser = _auth.currentUser;
    var response =
    await http.post(Domain().getDomainApi() + "/test/sil", body: {
      "testId" : testId,
      //"id": user.uid,
    });
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load post');
    }

  }
}