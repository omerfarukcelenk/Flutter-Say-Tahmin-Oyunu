import 'package:flutter/material.dart';
import 'package:uygulama_sayi_tahmin/TahminEkrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayı Tahmin Oyunu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Tahmin Oyunu",style: TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.bold),),
            Padding(
              padding:  EdgeInsets.only(right: 25),
              child: Center(child: Image.asset("images/zar.png")),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
              }, child: Text("Oyuna Başla",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
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
