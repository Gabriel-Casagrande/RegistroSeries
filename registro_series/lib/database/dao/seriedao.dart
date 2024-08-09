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

void insertTodasSeries() async {
  Database db = await getDatabase();
  // Inserir dados iniciais na tabela series
  db.insert(
      'series', {'id': 1, 'nome': 'Série 1', 'progresso': 0.7, 'avaliacao': 4});
  db.insert(
      'series', {'id': 2, 'nome': 'Série 2', 'progresso': 0.5, 'avaliacao': 3});
  db.insert(
      'series', {'id': 3, 'nome': 'Série 3', 'progresso': 0.9, 'avaliacao': 5});
  db.insert('series',
      {'id': 4, 'nome': 'Breaking Bad', 'progresso': 0.0, 'avaliacao': 5});
}
