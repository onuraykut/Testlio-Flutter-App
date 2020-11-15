const String arkadasEkle = 'arkadasEkle';
const String arkadasKabulEtti = 'arkadasKabulEtti';
const String arkadasSil = 'arkadasSil';
const String arkadasIstekCek = 'arkadasIstekCek';
const String arkadasIstekKabul = 'arkadasIstekKabul';
const String arkadasIstekRed = 'arkadasIstekRed';
const String kisiylePaylas = 'kisiylePaylas';
const String testCozuldu = 'testCozuldu';

class BildirimHazirla {

  String getBildirim(String bildirimKodu,String kullanici_ismi) {
    switch (bildirimKodu) {
      case testCozuldu:
        return '$kullanici_ismi kişisi gönderdiğin testi çözdü';
      case arkadasEkle:
        return '$kullanici_ismi kişisi sizi arkadaş olarak ekledi';
        break;
      case arkadasKabulEtti:
        return '$kullanici_ismi kişisi arkadaşlık isteğini kabul etti';
        break;
      case kisiylePaylas:
        return '$kullanici_ismi kişisi size test gönderdi';
        break;
    }
  }
}
