import 'dart:convert';

class Cozenler {
  String cozenUid;
  String cozenName;
  List<int> cevaplar;
  double sonuc;

  Cozenler({this.cozenUid, this.cozenName, this.cevaplar, this.sonuc});


  factory Cozenler.fromRawJson(String str) => Cozenler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cozenler.fromJson(Map<String, dynamic> json) => Cozenler(
      cozenUid: json["cozenUid"],
      cozenName: json["cozenName"],
      cevaplar: json["cevaplar"],
      sonuc: json["sonuc"]
  );

  Map<String, dynamic> toJson() => {
    "cozenUid": cozenUid,
    "cozenName": cozenName,
    "cevaplar": cevaplar,
    "sonuc": sonuc
  };
}