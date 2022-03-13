import 'package:jamedadi/course.dart';
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
    //create tables
    //   db.execute(
    //       'create table moin_table(id integer primary key autoincrement, word varchar(50), meaning varchar(255))');
    // }, onUpgrade: (Database db, int oldV, int newV) async {
    //   if (oldV < newV) {
    //     await db.execute("alter table moin_table add column level varchar(50) ");
    //   }
    // }

    return _db!;
  }

  Future<int> createCourse(Course course) async {
    Database db = await createDatabase();
    //db.rawInsert('insert into courses value')
    return db.insert('moin_table', course.toMap());
  }

  Future<List> allCourses() async {
    Database db = await createDatabase();
    //db.rawQuery('select * from courses');
    return db.query('moin_table');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('moin_table', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> courseUpdate(Course course) async {
    Database db = await createDatabase();
    return await db.update('moin_table', course.toMap(),
        where: 'id = ?', whereArgs: [course.id]);
  }
}
