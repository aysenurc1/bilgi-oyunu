import 'soru.dart';

class test_veri {
  int _soruIndex = 0;
  List<Soru> soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
  ];

  String getSoruMetni() {
    return soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    print(_soruIndex);
    print(soruBankasi.length);
    if (_soruIndex + 1 < soruBankasi.length) {
      _soruIndex++;
    }
  }

  bool testBittiMi() {
    print('test bitti mi soru index =$_soruIndex');
    if (_soruIndex + 1 == soruBankasi.length) {
      print('test bitti mi soru indexxxxxxxxxxxxxxxxx =$_soruIndex');
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruIndex = 0;
  }
}
