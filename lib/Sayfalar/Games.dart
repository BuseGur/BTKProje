import 'package:flutter/material.dart';

void first() {
  runApp(MaterialApp(home: GamesPage()));
}

class GamesPage extends StatefulWidget {
  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  String mesaj = "Eğitici Oyunlar";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}