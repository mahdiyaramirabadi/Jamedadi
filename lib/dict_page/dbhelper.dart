import 'package:jamedadi/dict_page/Word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() {
    return _instance;
  }

  DbHelper.internal();
  static Database? _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db!;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'dict.db');
    _db = await openDatabase(path);

    return _db!;
  }

  Future<int> createWord(Word Word) async {
    Database db = await createDatabase();
    //db.rawInsert('insert into Words value')
    return db.insert('moin_table', Word.toMap());
  }

  Future<List> allWords() async {
    Database db = await createDatabase();
    //db.rawQuery('select * from Words');
    return db.query('moin_table');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('moin_table', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> WordUpdate(Word Word) async {
    Database db = await createDatabase();
    return await db.update('moin_table', Word.toMap(),
        where: 'id = ?', whereArgs: [Word.id]);
  }
}
