import 'dart:convert';

class Bildirim {
  String bildirimID;
  String gonderenUid;
  String gonderenAdi;
  String testId;
  String roomId;
  String date;

  Bildirim({this.bildirimID, this.gonderenUid,this.gonderenAdi, this.date,this.testId,this.roomId});

  factory Bildirim.fromRawJson(String str) => Bildirim.fromJson(json.decode(str));

  factory Bildirim.fromJson(Map<String, dynamic> json) => Bildirim(
      bildirimID: json["bildirimID"] == null ? null : json["bildirimID"],
      gonderenUid: json["gonderenUid"] == null ? null : json["gonderenUid"],
      gonderenAdi: json["gonderenAdi"] == null ? null : json["gonderenAdi"],
      testId: json["testId"] == null ? null : json["testId"],
      roomId: json["roomId"] == null ? null : json["roomId"],
      date: json["date"] == null ? null : json["date"]
  );

  @override
  String toString() {
    return 'Bildirim{bildirimID: $bildirimID, gonderenUid: $gonderenUid, gonderenAdi: $gonderenAdi, extra: $testId, date: $date}';
  }
}