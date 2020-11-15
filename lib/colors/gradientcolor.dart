import 'package:flutter/material.dart';

class GradientColors {
  static final AlignmentGeometry _beginAlignment = Alignment.topLeft;
  static final AlignmentGeometry _endAlignment = Alignment.bottomRight;
  static final AlignmentGeometry _beginverticalAlignment = Alignment.topCenter;
  static final AlignmentGeometry _endverticalAlignment = Alignment.bottomCenter;
  static final AlignmentGeometry centerAlignment = Alignment.center;


  static LinearGradient buildGradient(AlignmentGeometry begin, AlignmentGeometry end, List<Color> colors) =>
      LinearGradient(begin: begin, end: end, colors: colors);

  static const hotLinear = LinearGradient(
      colors: [Color(0xffF55B9A), Color(0xffF9B16E)], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static LinearGradient coralCandyGradient =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xffFFF0D1), Color(0xffFFB8C6)]);

  static LinearGradient serve =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xff485563), Color(0xff485563)]);

  static LinearGradient ali =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xffff4b1f), Color(0xff1fddff)]);

  static LinearGradient aliHussien =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xfff7ff00), Color(0xffdb36a4)]);

  static LinearGradient backToFuture =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xffC02425), Color(0xffF0CB35)]);

  static LinearGradient tameer =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xff136a8a), Color(0xff267871)]);

  static LinearGradient rainbowBlue =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xff1fddff), Color(0xff0575E6)]);

  static LinearGradient blush =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xffB24592), Color(0xffF15F79)]);

  static LinearGradient byDesign =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xff009FFF), Color(0xffec2F4B)]);

  static LinearGradient haze =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xffE8EDF4), Color(0xffF6F6F8)]);

  static LinearGradient jShine =
  buildGradient(_beginAlignment, _endAlignment, const [Color(0xff12c2e9), Color(0xffc471ed), Color(0xfff64f59)]);

  static LinearGradient hersheys = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xfff1e130c),
    Color(0xff9a8478),
  ]);

  static LinearGradient Background1 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff43C6AC),
    Color(0xff191654),
  ]);

  static LinearGradient Background2 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff3a6186),
    Color(0xff89253e),
  ]);

  static LinearGradient Background3 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff4ecdc4),
    Color(0xff556270),
  ]);

  static LinearGradient Background4 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffbe93c5),
    Color(0xff7bc6cc),
  ]);
  static LinearGradient Background5 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffe96443),
    Color(0xff904e95),
  ]);
  static LinearGradient Background6 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff4b79a1),
    Color(0xff283e51),
  ]);
  static LinearGradient Background7 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff2980b9),
    Color(0xff2c3e50),
  ]);
  static LinearGradient Background8 = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff2c3e50),
    Color(0xff3498db),
  ]);

  static LinearGradient CardColor = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff6DC8F3),
    Color(0xff73A1F9),
  ]);

  static LinearGradient beyaz = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffffffff),
    Color(0xffffffff),
  ]);


  static LinearGradient taitanum = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff283048),
    Color(0xff859398),
  ]);

  static LinearGradient cosmicFusion = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xfffff00cc),
    Color(0xff333399),
  ]);

  static LinearGradient coldLinear = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xfff20BDFF),
    Color(0xffA5FECB),
  ]);
  static LinearGradient yesil = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff98ff98),
    Color(0xff98ff98),
  ]);
  static LinearGradient deepSpace = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff000000),
    Color(0xff434343),
  ]);

  static LinearGradient anasayfaswiper = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff465DE2),
    Color(0xff764BA2),
  ]);

  static LinearGradient eglence = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffFF416C),
    Color(0xff8A52E9),
  ]);

  static LinearGradient kitap = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffFFA72F),
    Color(0xffFF641A),
  ]);
  
  static LinearGradient kategoriis = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff1EFFC2),
    Color(0xff0A04BF),
  ]);

  static LinearGradient filmdizi = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffFF7765),
    Color(0xffF7A23C),
  ]);

  static LinearGradient gezi = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffEF32D9),
    Color(0xff376DF6),
  ]);

  static LinearGradient aile = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff21E8AC),
    Color(0xff376DF6),
  ]);
  static LinearGradient teknoloji = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff0C1DB5),
    Color(0xffBEE4F8),
  ]);
  static LinearGradient yasamtarzi = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffF3866B),
    Color(0xff6FEE00),
  ]);
  static LinearGradient ask = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffFF0101),
    Color(0xff764BA2),
  ]);
  static LinearGradient yemek = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffC69FA8),
    Color(0xff0247AF),
  ]);
  static LinearGradient ahlakiikilem = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff465DE2),
    Color(0xff764BA2),
  ]);
  static LinearGradient diger = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff7EFFFF),
    Color(0xff0962A7),
  ]);
  static LinearGradient arkaplan = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff7EFFFF),
    Color(0xff0962A7),
  ]);
  static LinearGradient sevgiliye = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffAC0707),
    Color(0xffFFFFFF),
  ]);
  static LinearGradient florte = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff5D13CE),
    Color(0xffFFFFFF),
  ]);
  static LinearGradient kadin = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffBB00D8),
    Color(0xffFFFFFF),
  ]);
  static LinearGradient erkek = buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff0011FF),
    Color(0xffFFFFFF),
  ]);

   static LinearGradient cardProfile = buildGradient(_beginverticalAlignment, _endverticalAlignment, const [
    Colors.white,
    Colors.white70,
  ]);

  static LinearGradient listGradient =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff8A52E9),
    Color(0xffFF416C),
  ]);
  static LinearGradient roseanna =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffffafbd),
    Color(0xffffc3a0),
  ]);
  static LinearGradient sexyblue =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff2193b0),
    Color(0xff6dd5ed),
  ]);
  static LinearGradient purplelove =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffcc2b5e),
    Color(0xff753a88),
  ]);
  static LinearGradient piglet =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffee9ca7),
    Color(0xffffdde1),
  ]);
  static LinearGradient mauve =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff42275a),
    Color(0xff734b6d),
  ]);
  static LinearGradient shadesofgrey =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffbdc3c7),
    Color(0xff2c3e50),
  ]);
  static LinearGradient lostmemory =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffde6262),
    Color(0xffffb88c),
  ]);
  static LinearGradient socialive =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff06beb6),
    Color(0xff48b1bf),
  ]);
  static LinearGradient cherry =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffeb3349),
    Color(0xfff45c43),
  ]);
  static LinearGradient pinky =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffdd5e89),
    Color(0xfff7bb97),
  ]);
  static LinearGradient lush =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff56ab2f),
    Color(0xffa8e063),
  ]);
  static LinearGradient kashmir =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff614385),
    Color(0xff516395),
  ]);
  static LinearGradient tranquil =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffeecda3),
    Color(0xffef629f),
  ]);
  static LinearGradient palewood =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffeacda3),
    Color(0xffd6ae7b),
  ]);
  static LinearGradient greenbeach =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff02aab0),
    Color(0xff00cdac),
  ]);
  static LinearGradient shalala =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffd66d75),
    Color(0xffe29587),
  ]);
  static LinearGradient frost =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff000428),
    Color(0xff004e92),
  ]);
  static LinearGradient almost =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffddd6f3),
    Color(0xfffaaca8),
  ]);
  static LinearGradient virginamerica =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff7b4397),
    Color(0xffdc2430),
  ]);
  static LinearGradient endlessriver =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff185a9d),
    Color(0xff43cea2),
    Color(0xff185a9d),
  ]);
  static LinearGradient purplewhite =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffba5370),
    Color(0xfff4e2d8),
  ]);
  static LinearGradient bloodmary =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffff512f),
    Color(0xffdd2476),
  ]);
  static LinearGradient lovetonight =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff4568dc),
    Color(0xffb06ab3),
  ]);
  static LinearGradient bourbon =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffec6f66),
    Color(0xfff3a183),
  ]);
  static LinearGradient dusk =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffffd89b),
    Color(0xff19547b),
  ]);

  static LinearGradient relay =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff3a1c71),
    Color(0xffffaf7b),
  ]);
  static LinearGradient decent =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff4ca1af),
    Color(0xffc4e0e5),
  ]);
  static LinearGradient sweetmorning =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffff5f6d),
    Color(0xffffc371),
  ]);
  static LinearGradient scooter =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff36d1dc),
    Color(0xff5b86e5),
  ]);
  static LinearGradient celestial =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffc33764),
    Color(0xff1d2671),
  ]);
  static LinearGradient royal =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff141e30),
    Color(0xff243b55),
  ]);
  static LinearGradient endsunset =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffff7e5f),
    Color(0xfffeb47b),
  ]);
  static LinearGradient peach =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffed4264),
    Color(0xffffedbc),
  ]);
  static LinearGradient seablue =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff2b5876),
    Color(0xff4e4376),
  ]);
  static LinearGradient orangecoal =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffff9966),
    Color(0xffff5e62),
  ]);
  static LinearGradient aubergine =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffaa076b),
    Color(0xff61045f),
  ]);
  static LinearGradient denemekart =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xff6DC8F3),
    Color(0xff73A1F9),
  ]);
  static LinearGradient red =
  buildGradient(_beginAlignment, _endAlignment, const [
    Color(0xffd30000),
    Color(0xffd30000),
  ]);
  
}


class KategoriRenkler {
  KategoriRenkler(this.gradient, this.name);

  LinearGradient gradient;
  String name;
}

List<KategoriRenkler> renkler = [
  KategoriRenkler(GradientColors.eglence,"Eğlence"),
  KategoriRenkler(GradientColors.kitap,"Kitap"),
  KategoriRenkler(GradientColors.kategoriis,"İş"),
  KategoriRenkler(GradientColors.filmdizi,"Film-Dizi"),
  KategoriRenkler(GradientColors.gezi,"Gezi"),
  KategoriRenkler(GradientColors.aile,"Aile"),
  KategoriRenkler(GradientColors.teknoloji,"Teknoloji"),
  KategoriRenkler(GradientColors.yasamtarzi,"Yaşam Tarzı"),
  KategoriRenkler(GradientColors.ask,"Aşk"),
  KategoriRenkler(GradientColors.yemek,"Yemek"),
  KategoriRenkler(GradientColors.ahlakiikilem,"Ahlaki İkilem"),
  KategoriRenkler(GradientColors.diger,"Diğer"),
  KategoriRenkler(GradientColors.sevgiliye,"Sevgiliye"),
  KategoriRenkler(GradientColors.florte,"Flörte"),
  KategoriRenkler(GradientColors.kadin,"Kadın"),
  KategoriRenkler(GradientColors.erkek,"Erkek"),
  
];