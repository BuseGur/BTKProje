import 'package:btkproje/Sayfalar/Note.dart';
import 'package:btkproje/Sayfalar/note_validator.dart';
import 'package:flutter/material.dart';

class NoteAdd extends StatefulWidget {
  final List<Note> notes;

  const NoteAdd(this.notes, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _NoteAddState();
  }
}

class _NoteAddState extends State<NoteAdd> with NoteValidationMixin {
  late final List<Note> notes;
  final note = Note.withoutInfo();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    notes = widget.notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Ekle"),
        foregroundColor: Colors.lightBlue,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
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
      decoration: const InputDecoration(labelText: "Başlık"),
      validator: validateNoteName,
      onSaved: (String? value) {
        note.noteName = value ?? '';
      },
    );
  }

  Widget buildDescriptionField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Açıklama"),
      validator: validateDescription,
      onSaved: (String? value) {
        note.description = value ?? '';
      },
    );
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          notes.add(note);
          saveNotes();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveNotes() {
    print(note.noteName);
    print(note.description);
  }
}
