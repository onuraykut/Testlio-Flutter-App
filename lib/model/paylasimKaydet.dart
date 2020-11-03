// To parse this JSON data, do
//
//     final paylasim = paylasimFromJson(jsonString);

import 'dart:convert';

class PaylasimKaydet {
  String testId;
  String testAdi;
  String paylasanUid;
  List<int> paylasanCevaplari;

  PaylasimKaydet({
    this.testId,
    this.testAdi,
    this.paylasanUid,
    this.paylasanCevaplari,
  });

  factory PaylasimKaydet.fromRawJson(String str) => PaylasimKaydet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaylasimKaydet.fromJson(Map<String, dynamic> json) => PaylasimKaydet(
    testId: json["testId  "],
    testAdi: json["testAdi"],
    paylasanUid: json["paylasanUid"],
    paylasanCevaplari: List<int>.from(json["paylasanCevaplari"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "testId": testId,
    "testAdi": testAdi,
    "paylasanUid": paylasanUid,
    "paylasanCevaplari": List<dynamic>.from(paylasanCevaplari.map((x) => x)),
  };
}
