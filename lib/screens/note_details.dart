import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Note.dart';
import '../database_helper.dart';
<<<<<<< HEAD
import 'package:intl/intl.dart';
=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
import '../util.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;
<<<<<<< HEAD
=======

>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
<<<<<<< HEAD
  
=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Note note;
  final List<String> _priorities = Util.priorities;

  NoteDetailState(this.note, this.appBarTitle);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
<<<<<<< HEAD

=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
    titleController.text = note.title;
    descriptionController.text = note.description;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
<<<<<<< HEAD
            title: Text(appBarTitle),
          leading: IconButton(
            
=======
          title: Text(appBarTitle),
          leading: IconButton(
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
            onPressed: moveToLastScreen,
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                  child: new ListTile(
                    leading: const Icon(Icons.low_priority),
                    title: DropdownButton(
                        items: _priorities.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          );
                        }).toList(),
<<<<<<< HEAD
                       value: Util.getPrioritiyAsString(note.priority),
=======
                        value: Util.getPrioritiyAsString(note.priority),
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            updatePriorityAsInt(valueSelectedByUser);
                          });
<<<<<<< HEAD
                        },
                   ),
=======
                        }),
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      updateTitle();
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      icon: Icon(Icons.title),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      updateDescription();
                    },
                    decoration: InputDecoration(
                      labelText: 'Details',
                      icon: Icon(Icons.details),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.green,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.red,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              _delete();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
    } else {
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      _showAlertDialog("Status", "Note Saved Successfully");
    } else {
      _showAlertDialog("Status", "Problem Saving Note");
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (note.id == null) {
<<<<<<< HEAD
      _showAlertDialog("Status", "Please add a Note");
=======
      _showAlertDialog("Status", "First Add a Note");
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
      return;
    }

    int result = await helper.deleteNote(note.id);
<<<<<<< HEAD
=======

>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
    if (result != 0) {
      _showAlertDialog("Status", "Note Deleted Successfully");
    } else {
      _showAlertDialog("Status", "Error");
    }
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

<<<<<<< HEAD
  //Convert int to string to show to user

=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog,
    );
  }
  

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
<<<<<<< HEAD

  
=======
>>>>>>> 8e37f0c385649d96f5e056622c6341add55790db
}
