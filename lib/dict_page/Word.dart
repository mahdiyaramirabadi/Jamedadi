class Word {
  int? _id;
  String? _word;
  String? _meaning;

  Word.fromMap(Map<String, dynamic> data) {
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
