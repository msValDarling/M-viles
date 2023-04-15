import 'dart:io';
import 'package:path/path.dart';
import 'package:pmsna/models/event_model.dart';
import 'package:pmsna/screen/onboarding.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../models/post_model.dart';

class DatabaseHelper {
  static final nameDB = 'SOCIALDB';
  static final versionDB = 9;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''CREATE TABLE tblPost(
    idPost INTEGER PRIMERY KEY,
    dscPost VARCHAR(200),
    datePost DATE
   );''';
    db.execute(query);
    String query2 = '''
    CREATE TABLE tblEvento(
      idEvento INTEGER PRIMARY KEY,
      descEvento VARCHAR(200),
      fechaEvento DATE,
      completado BOOLEAN
    );
  ''';
    await db.execute(query2);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    print(data);
    return await conexion.insert(tblName, data);
  }

  Future<int> UPDATE(
      String tblName, Map<String, dynamic> data, String idColumnName) async {
    var conexion = await database;
    return conexion.update(tblName, data,
        where: '$idColumnName = ?', //las consultas parametrisadas son con ?
        whereArgs: [data['idColumnName']]);
  }

  Future<int> DELETE(String tblName, int id, String idColumnName) async {
    var conexion = await database;
    return conexion
        .delete(tblName, where: '$idColumnName = ?', whereArgs: [id]);
  }

  Future<List<PostModel>> GETALLPOST() async {
    var conexion = await database;
    var result = await conexion.query('tblPost');
    return result.map((post) => PostModel.fromMap(post)).toList();
  }
  //future builder solo se ejecuta 1 vez
  //stream builder se ejecuta(renderiza) en segundo plano muchas veces

  //----FUTUROS pa los eventos

  Future<List<EventModel>> getAllEventos() async {
    var conexion = await database;
    var result = await conexion.query('tblEvento');
    return result.map((evento) => EventModel.fromMap(evento)).toList();
  }

  Future<List<EventModel>> getEvent(int id) async {
    var conexion = await database;
    var query = "Select * from tblEvento where idEvento = ?";
    var result = await conexion.rawQuery(query, [id]);

    List<EventModel> eventos = [];
    if (result != null && result.isNotEmpty) {
      eventos = result.map((evento) => EventModel.fromMap(evento)).toList();
    }
    return eventos;
  }
}
