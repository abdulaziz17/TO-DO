class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._description, this._date, [this._priority]);
  Note.withId(this._id, this._title, this._description, this._date,
      [this._priority]);

  // Getters
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // Setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newdescription) {
    if (newdescription.length <= 255) {
      this._description = description;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  //Used to save and retreive from DB

  //Converting the note to a map that is key value pair
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> newMap) {
    this._id = newMap['id'];
    this._title = newMap['title'];
    this._description = newMap['description'];
    this._priority = newMap['priority'];
    this._date = newMap['date'];
  }
}
