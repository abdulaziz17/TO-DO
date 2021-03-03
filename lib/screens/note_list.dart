import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
<<<<<<< HEAD
import '../database_helper.dart';
=======

>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
import '../Note.dart';
import '../database_helper.dart';
import '../util.dart';
import 'note_details.dart';
<<<<<<< HEAD
import '../util.dart';
=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
<<<<<<< HEAD
Future<List<Note>> getNoteList() async {
=======

  Future<List<Note>> getNoteList() async {
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
    this.noteList = await databaseHelper.getNoteList();
    return noteList;
  }

 
  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
<<<<<<< HEAD
   @override
=======

  @override
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: FutureBuilder<List<Note>>(
          future: getNoteList(),
          builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
            if (snapshot.hasData) {
              List<Note> noteList = snapshot.data;

              if (noteList.isEmpty) {
                return Center(
                  child: Text('Add notes by tapping on the + button'),
                );
              }

              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: noteList.length,
                itemBuilder: (BuildContext context, int index) {
                  Note note = noteList.elementAt(index);
                  String noteTitle = note.title;
                  String noteDescription = note.description;
                  String noteDate = note.date;
                  int notePriorityAsInt = note.priority;
                  String notePriorityAsString =
                      Util.getPrioritiyAsString(notePriorityAsInt);

                  return ListTile(
                    title: Text(noteTitle),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        noteDescription != null
                            ? Text(noteDescription)
                            : SizedBox.shrink(),
                        Text(
                          noteDate,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(notePriorityAsString),
                    onTap: () async {
                      bool result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NoteDetail(note, "Edit Note"),
                        ),
                      );

                      if (result == true) {
                        updateListView();
                      }
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          bool result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NoteDetail(Note("", "", 2), "Add Note"),
            ),
          );

          if (result == true) {
            updateListView();
          }
        },
      ),
    );
  }
<<<<<<< HEAD

=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
}
