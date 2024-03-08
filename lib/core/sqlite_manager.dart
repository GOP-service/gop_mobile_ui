import 'package:gop_mobile_ui/src/data/model/auth_model.dart';
import 'package:sqflite/sqflite.dart';

class DbManager{
  static final DbManager instance = DbManager._internal();

  static Database? _database;

  DbManager._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/gop.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE token(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            accessToken TEXT NOT NULL, 
            refreshToken TEXT NOT NULL)''',
        );
      },
    );
  }

  Future<int> insert(AuthModel model) async {
    final db = await instance.database;
    return await db.insert('token', model.toJson());
  }

  Future<AuthModel> get() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('token');
    return AuthModel.fromJson(maps.first);
  }



}