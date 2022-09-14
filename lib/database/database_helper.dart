import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/tareas_model.dart';

class DatabaseHelper {
  static final nombreBD = 'NOTASBD';
  static final versionDB = 1;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaBD = join(carpeta.path, nombreBD);
    return await openDatabase(
      rutaBD,
      version: versionDB,
      onCreate: _crearTablas,
    );
  }

  _crearTablas(Database db, int version) async {
    String query =
        "CREATE TABLE tbTareas(idTarea integer primary key not null, dscTarea varchar(100), fechaEnt Date)";
    db.execute(query);
  }

//es int pq regresa el id jwjwjsjjs
  Future<int> insertar(Map<String, dynamic> row, String nomTabla) async {
    var conexion = await database;
    return await conexion.insert(nomTabla, row);
  }

  Future<int> actualizar(Map<String, dynamic> row, String nomTabla) async {
    var conexion = await database;
    return await conexion.update(nomTabla, row,
        where: 'idTarea = ?', whereArgs: [row['idTareas']]);
  }

  Future<int> eliminar(int idTarea, String nomTabla) async {
    var conexion = await database;
    return await conexion.delete(
      nomTabla,
      where: 'idTarea?',
      whereArgs: [idTarea],
    );
  }

  Future<List<TareasDAO>> getAllTareas() async {
    var conexion = await database;
    var result = await conexion.query('tblTareas');
    return result.map((mapTarea) => TareasDAO.fromJSON(mapTarea)).toList();
  }
}
