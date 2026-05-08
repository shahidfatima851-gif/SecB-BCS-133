import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/game_model.dart';

class DBHelper {
  static final DBHelper instance = DBHelper();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'game.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE games(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            guess INTEGER,
            result TEXT,
            time TEXT
          )
        ''');
      },
    );
  }

  Future insertGame(Game game) async {
    final db = await database;
    await db.insert('games', game.toMap());
  }

  Future<List<Game>> getGames() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('games');

    return List.generate(maps.length, (i) {
      return Game.fromMap(maps[i]);
    });
  }
}