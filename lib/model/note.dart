class Note {
  String _id;
  String _title;
  String _description;
  String _phone;

  Note(this._id, this._title, this._description, this._phone);

  Note.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._description = obj['description'];
    this._phone = obj['phone'];
  }

  String get id => _id;
  String get title => _title;
  String get description => _description;
  String get phone => _phone;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['phone'] = _phone;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._phone = map['phone'];
  }
}