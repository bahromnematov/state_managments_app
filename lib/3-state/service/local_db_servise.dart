import 'package:sqflite/sqflite.dart';
import 'package:state_managments_app/3-state/data/model/mind_model.dart';

class LocalDatabase {
  Database? database;
  String tableName = "minds";

  LocalDatabase();

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = '${databasePath}minds.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database
        .execute("CREATE TABLE $tableName(" "mind TEXT," "author TEXT" ")");
  }

  Future addMind(MindModel mind) async {
    Database db = await getDb();
    var id = await db.insert(tableName, mind.toJson());
  }

  Future<List> getMinds() async {
    Database db = await getDb();
    var result = await db.query(tableName, columns: ["author", "mind"]);
    return result.toList();
  }

  Future updateMind(MindModel mindModel, String mind) async {
    Database db = await getDb();
    var id = await db.update(tableName, mindModel.toJson(),
        where: "mind = ?", whereArgs: [mind]);
  }

  Future deleteMind(String mind) async {
    Database db = await getDb();
    var id = await db.delete(tableName, where: 'mind = ?', whereArgs: [mind]);
  }
}
