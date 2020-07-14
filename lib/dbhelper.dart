import 'package:chem/model/chemical.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(path,version: 1,onCreate: (Database db, int v){
      //create all tables
      db.execute("create table chemical(id integer primary key autoincrement, name varchar(50), volume varchar(255), price varchar(50), dose varchar(50))");
    });
    return _db;
  }

  Future<int> addChemical(Chemical chemical) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('chemical', chemical.toMap());
  }

  Future<List> allChemicals() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('chemical');
  }

  Future<int> deleteChemical(int id) async{
    Database db = await createDatabase();
    return db.delete('chemical',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> updateChemical(Chemical chemical) async{
    Database db = await createDatabase();
    return await db.update('chemical', chemical.toMap(),where: 'id = ?', whereArgs: [chemical.id]);
  }

}