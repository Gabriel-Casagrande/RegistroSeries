import 'package:registro_series/database/db.dart';
import 'package:registro_series/model/serie.dart';
import 'package:sqflite/sqflite.dart';

Future<int> insertSerie(Serie serie) async {
  Database db = await getDatabase();
  return db.insert('series', serie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Serie>> findAll() async {
  Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('series');

  return List.generate(maps.length, (i) {
    return Serie.fromMap(maps[i]);
  });
}

Future<int> deleteById(int id) async {
  Database db = await getDatabase();
  return db.delete('series', where: 'id = ?', whereArgs: [id]);
}
