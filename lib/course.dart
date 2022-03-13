class Course {
  //attributes = fields in table
  int? _id;
  String? _word;
  String? _meaning;
  Course(dynamic obj) {
    _id = obj['id'];
    _word = obj['word'];
    _meaning = obj['meaning'];
  }
  Course.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _word = data['word'];
    _meaning = data['meaning'];
  }
  Map<String, dynamic> toMap() => {
        'id': _id,
        'word': _word,
        'meaning': _meaning,
      };

  int? get id => _id;
  String? get word => _word;
  String? get meaning => _meaning;
}
