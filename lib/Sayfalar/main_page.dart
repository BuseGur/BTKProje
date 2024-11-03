
import 'package:btkproje/Sayfalar/Note.dart';
import 'package:btkproje/Sayfalar/note_add.dart';
import 'package:btkproje/Sayfalar/note_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String mesaj = "Not Defteri";

  Note selectedNote = Note.withId(0, "", "");

  List<Note> notes = [
    Note.withId(0, "", ""),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
        ),
        body: buildBody(context));
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://avatars.mds.yandex.net/i?id=0b5f80e447b98729be048d544e0b6bdff6244b45-5016797-images-thumbs&n=13"),
                    ),
                    title: Text(
                        notes[index].noteName + " " + notes[index].description),
                    onTap: () {
                      setState(() {
                        selectedNote = notes[index];
                      });
                      print(selectedNote.noteName);
                    },
                  );
                })),
        Text("Seçili Not: " + selectedNote.noteName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 1.0),
                    Text("Yeni Not"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NoteAdd(notes)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 1.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteEdit(selectedNote)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 1.0),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    notes.remove(selectedNote);
                  });
                  var mesaj = "Silindi: " + selectedNote.noteName;
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
