import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// import 'dart:async';
import '../database_helper.dart';
import '../Note.dart';
import 'note_details.dart';
// import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList != null) {
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        backgroundColor: Colors.blue,
      ),
      body: getNodeListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        child: Icon(Icons.add),
        onPressed: () {
          navigateToDetail(Note('', '', '', 1), 'Add A Note');
        },
      ),
    );
  }

  ListView getNodeListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, position) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.purple,
          elevation: 4.0,
          child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://learncodeonline.in/mascot.png"),
              ),
              title: Text(this.noteList[position].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0)),
              subtitle: Text(
                this.noteList[position].date,
                style: TextStyle(color: Colors.white),
              ),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                  ),
                  onTap: () {
                    navigateToDetail(this.noteList[position], 'Edit task');
                  })),
        );
      },
    );
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, title);
    }));

    if (result == true) {
      updateListView();
    }
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
}
