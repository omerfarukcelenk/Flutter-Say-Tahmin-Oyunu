import 'package:flutter/material.dart';
import 'package:uygulama_sayi_tahmin/TahminEkrani.dart';

class SonucEkrani extends StatefulWidget {

  late bool sonuc;


  SonucEkrani({required this.sonuc});

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            widget.sonuc ? Image.asset("images/mutlu_resim.png") : Image.asset("images/uzgun_resim.png") ,
            Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz",style: TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.bold),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Tekrar Dene",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
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
