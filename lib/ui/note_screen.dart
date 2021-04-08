import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/note.dart';
import 'package:flutter_firebase/service/firebase_firestore_service.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  NoteScreen(this.note);

  @override
  State<StatefulWidget> createState() => new _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  FirebaseFirestoreService db = new FirebaseFirestoreService();

  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _phoneController;
  @override
  void initState() {
    super.initState();

    _titleController = new TextEditingController(text: widget.note.title);
    _descriptionController = new TextEditingController(text: widget.note.description);
    _phoneController= new TextEditingController(text: widget.note.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('Note')),

      body: Container(

        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Adress'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.note.id != null) ? Text('Update') : Text('Add'),

              onPressed: () {
                if (widget.note.id != null) {
                  db
                      .updateNote(
                      Note(widget.note.id, _titleController.text, _descriptionController.text, _phoneController.text))
                      .then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  db.createNote(_titleController.text, _descriptionController.text, _phoneController.text).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}