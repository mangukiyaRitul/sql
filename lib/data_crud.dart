import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class  data {

  data._init();
  static data instance = data._init();
  Database? _database;

  Future<Database> get database async =>
      instance._database ?? await creatdatabase();

  Future<Database> creatdatabase() async {
    final myPath = await getDatabasesPath();
    final path = "$myPath/notes.db";
    final database  = await openDatabase(path, version: 1, onCreate: (
      Database db,
      int version,
    ) {
      db.execute("""
   CREATE TABLE MANGUKIYA (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT,
   number TEXT
   )
   """);
    });

    return database;
  }

  savedata({required String name, required String phone}) async {
    final db = await instance.database;
    await db.insert("MANGUKIYA", {
      "name":"$name",
      "number":"$phone"
    });
  }

  updatedata(
      {required String name, required String phone, required int id}) async {
   final db = await instance.database;
    String qry =
        "UPDATE MANGUKIYA SET name = '$name', number = '$phone' WHERE id = $id ";
    await db.rawUpdate(qry).then((value) {
      debugPrint("$value");
    });
  }

  deletdata({required int id}) async {
    final db = await instance.database;
    String qry = "DELETE FROM MANGUKIYA WHERE id = $id ";
    await db.rawDelete(qry).then((value) {
      debugPrint("$value");
    });
  }

  Future<List<Map>> getdata() async {
    final db = await instance.database;
    String qry = "select * from MANGUKIYA";
    List<Map> datas = await db.rawQuery(qry);
    return datas;
  }
}
