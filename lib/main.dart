import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  int pengali = 1;
  String ubah = "Angka";
  String lawanUbah = "Huruf";
  String hasil = "";
  int angka = 0;

  void hitKali(){
    setState(() {
     pengali = pengali * 2;
    });
  }

  void hitTambah(){
    setState(() {
     angka += pengali;
     if(ubah == "Angka"){
       hasil += (angka).toString() +" ";
     }
     else{
       hasil+=String.fromCharCode(65+angka - 1) + " "; 
     }
    });
  }

  void hitUbah(){
    setState(() {
      if(ubah == "Huruf"){
        ubah = "Angka";
        lawanUbah = "Huruf";
      }
      else{
        ubah = "Huruf";
        lawanUbah = "Angka";
      }
    });
  }

  void hitReset(){
    setState(() {
      hasil = "";
      pengali = 1;
      angka = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar (
          title: Text("Latihan Flutter"),
        ),
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: <Color>[Colors.lime, Colors.green]
            ),
          ),
          margin: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text("Pengali: " + pengali.toString()),
            Text("Hasil: " + hasil.toString()),
            Text(ubah),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
              RaisedButton(child: Text("Kalikan dengan 2"), onPressed: hitKali),
              RaisedButton(child: Text("Tambahkan"), onPressed: hitTambah),
              RaisedButton(child: Text("Ubah ke "+lawanUbah), onPressed: hitUbah, color:Colors.blue, textColor: Colors.white),
              RaisedButton(child: Text("RESET"), onPressed: hitReset, color:Colors.blue, textColor: Colors.white), 
              ],
            )
          ])
        )
    ));
  }
}