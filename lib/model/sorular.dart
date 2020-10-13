class Sorular {
  Sorular({
    this.soruTipi,
    this.soru,
    this.siklar,
  });

  int soruTipi;
  String soru;
  List<String> siklar;

  factory Sorular.fromJson(Map<String, dynamic> json) => Sorular(
    soruTipi: json["soruTipi"] == null ? null : json["soruTipi"],
    soru: json["soru"] == null ? null : json["soru"],
    siklar: json["siklar"] == null ? null : List<String>.from(json["siklar"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "soruTipi": soruTipi == null ? null : soruTipi,
    "soru": soru == null ? null : soru,
    "siklar": siklar == null ? null : List<dynamic>.from(siklar.map((x) => x)),
  };

  @override
  String toString() {
    return 'Sorular{soruTipi: $soruTipi, soru: $soru, siklar: $siklar}';
  }
}
