import 'package:flutter/material.dart';

void first() {
  runApp(MaterialApp(home: VideosPage()));
}

class VideosPage extends StatefulWidget {
  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  String mesaj = "Eğitici Videolar";


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