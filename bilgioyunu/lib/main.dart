import 'package:flutter/material.dart';

import 'test_veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  test_veri test_1 = test_veri();

  void butonFonksiyonu(bool secilenButon) {
    print(secimler);
    if (test_1.testBittiMi() == true) {
      print("bitti");
      setState(() {
        test_1.testiSifirla();
        secimler = [];
        print("$secimler.length =aa");
        print("bittiiiitt");
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("BRAVO TESTİ BİTİRDİNİZ!!!"),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new ElevatedButton(
                child: new Text("BAŞA DÖN"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testiSifirla();
                    secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
    }

    setState(
      () {
        if (test_1.getSoruYaniti() == secilenButon) {
          secimler.add(dogruIconu);
          print(test_1.getSoruYaniti());
          print("a");
        } else {
          secimler.add(yanlisIconu);
          print(test_1.getSoruYaniti());
          print(secilenButon);

        }
        test_1.sonrakiSoru();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  test_1.getSoruMetni(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 3, //smileylerin satır arası boşluk mesafesi
            spacing: 3, //smileylerin satır arası boşluk mesafesi

            children: secimler,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          minimumSize: Size(150, 50),
                        ),
                        child: Icon(Icons.thumb_up, size: 30.0),
                        onPressed: () {
                          butonFonksiyonu(true);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          minimumSize: Size(150, 50),
                        ),
                        child: Icon(Icons.thumb_down, size: 30.0),
                        onPressed: () {
                          butonFonksiyonu(false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}

const Icon dogruIconu = Icon(Icons.mood, color: Colors.green);
const Icon yanlisIconu = Icon(Icons.mood_bad, color: Colors.red);
