// To parse this JSON data, do
//
//     final paylasim = paylasimFromJson(jsonString);

import 'dart:convert';

class PaylasimKaydet {
  String testID;
  String paylasanUid;
  List<int> paylasanCevaplari;

  PaylasimKaydet({
    this.testID,
    this.paylasanUid,
    this.paylasanCevaplari,
  });

  factory PaylasimKaydet.fromRawJson(String str) => PaylasimKaydet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaylasimKaydet.fromJson(Map<String, dynamic> json) => PaylasimKaydet(
    testID: json["testID"],
    paylasanUid: json["paylasanUid"],
    paylasanCevaplari: List<int>.from(json["paylasanCevaplari"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "testID": testID,
    "paylasanUid": paylasanUid,
    "paylasanCevaplari": List<dynamic>.from(paylasanCevaplari.map((x) => x)),
  };
}
