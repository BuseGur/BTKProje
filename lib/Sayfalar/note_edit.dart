import 'package:btkproje/Sayfalar/Note.dart';
import 'package:btkproje/Sayfalar/note_validator.dart';
import 'package:flutter/material.dart';


class NoteEdit extends StatefulWidget {
  final Note selectedNote;

  NoteEdit(this.selectedNote);

  @override
  State<StatefulWidget> createState() {
    return _NoteEditState(selectedNote);
  }
}

class _NoteEditState extends State<NoteEdit> with NoteValidationMixin {
  late Note selectedNote;
  final formKey = GlobalKey<FormState>();

  _NoteEditState(this.selectedNote);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildNoteNameField(),
              buildDescriptionField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNoteNameField() {
    return TextFormField(
      initialValue: selectedNote.noteName,
      decoration: InputDecoration(labelText: "Başlık"),
      validator: validateNoteName,
      onSaved: (String? value) {
        selectedNote.noteName = value ?? '';
      },
    );
  }

  Widget buildDescriptionField() {
    return TextFormField(
      initialValue: selectedNote.description,
      decoration: InputDecoration(labelText: "Açıklama"),
      validator: validateDescription,
      onSaved: (String? value) {
        selectedNote.description = value ?? '';
      },
    );
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveNotes();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveNotes() {
    print(selectedNote.noteName);
    print(selectedNote.description);
  }
}
