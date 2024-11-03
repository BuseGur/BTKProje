import 'package:btkproje/Sayfalar/Games.dart';
import 'package:btkproje/Sayfalar/Question.dart';
import 'package:btkproje/Sayfalar/books.dart';
import 'package:btkproje/Sayfalar/main_page.dart';
import 'package:btkproje/Sayfalar/videos.dart';
import 'package:flutter/material.dart';

void first() {
  runApp(MaterialApp(home: FirstPage()));
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String mesaj = "İlk Sayfa";
  String _selectedMood = "Harika";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mesajGoster(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Bugün Nasıl Hissediyorsun?"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: _selectedMood,
            items: ["Harika", "İdare Eder", "Kötü"].map((String mood) {
              return DropdownMenuItem<String>(
                value: mood,
                child: Text(mood),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedMood = newValue!;
              });
              // Seçime göre yönlendirme
              if (newValue == "İdare Eder") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideosPage()),
                );
              } else if (newValue == "Kötü") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamesPage()),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Tamam"),
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Notlar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Kitaplar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksPage()),
                );
              },
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Soru Havuzu"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
