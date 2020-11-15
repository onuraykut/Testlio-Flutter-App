// To parse this JSON data, do
//
//     final paylasim = paylasimFromJson(jsonString);

import 'dart:convert';

class Room {
  String id;
  String testId;
  String testAdi;
  String olusturanUid;
  String createdDate;
  int cozenSayisi;
  String roomLink;

  Room({
    this.id,
    this.testId,
    this.testAdi,
    this.olusturanUid,
    this.createdDate,
    this.cozenSayisi,
    this.roomLink
  });

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
      id: json["id"],
      testId: json["testId"],
    testAdi: json["testAdi"],
    createdDate: json["createdDate"],
    cozenSayisi: json["cozenSayisi"],
      roomLink: json["roomLink"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "testId": testId,
    "testAdi": testAdi,
    "olusturanUid": olusturanUid,
    "createdDate": createdDate,
    "cozenSayisi": cozenSayisi,
    "roomLink": roomLink
  };
}
