import 'package:flutter/material.dart';

void first() {
  runApp(MaterialApp(home: BooksPage()));
}

class BooksPage extends StatefulWidget {
  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  String mesaj = "Kitaplar";


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