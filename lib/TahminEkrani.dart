import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uygulama_sayi_tahmin/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";
  var gorunsunMu = false;

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101); // 0 - 100
    print("Rastgele Sayi : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Kalan Hak : $kalanHak",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,),),
            Text("Yardım : $yonlendirme",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
            Visibility(
                visible: gorunsunMu,
                child: Text("Dikkat Tek Hakkın Kaldı",style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.bold),)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: TextField(
                controller: tfTahmin,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.grey,

                  hintText: "Tahmininizi Yazınız",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black)
                  )

                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed: () {

                setState(() {
                  kalanHak = kalanHak - 1;
                });

                int tahmin = int.parse(tfTahmin.text);

                if(tahmin == rastgeleSayi){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)));
                  return;
                }

                if(tahmin > rastgeleSayi){
                  setState(() {
                    yonlendirme = "Tahmini Azalt";
                  });
                }

                if(tahmin < rastgeleSayi){
                  setState(() {
                    yonlendirme = "Tahmini Arttır";
                  });
                }

                if(kalanHak == 0){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false,)));
                }

                tfTahmin.text = "";

                if(kalanHak == 1){
                  setState(() {
                    gorunsunMu = true;
                  });
                }


              }, child: Text("Tahmin Et",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
