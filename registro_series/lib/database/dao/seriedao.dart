import 'package:registro_series/database/db.dart';
import 'package:registro_series/model/serie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

// Future<int> insertDog(Dog dog) async {
//   Database db = await getDatabase();
//   return db.insert('dogs', dog.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace);
// }

// Future<List<Map>> findall() async {
//   Database db = await getDatabase();
//   List<Map<String, dynamic>> dados = await db.query('dogs');

//   dados.forEach((dog) {
//     print(dog);
//   });

//   return dados;
// }

// Future<int> deleteById(int id) async {
//   debugPrint('Deletando o ID');
//   Database db = await getDatabase();
//   return db.delete('dogs', where: 'id = ?', whereArgs: [id]);
// }

Future<int> insertSerie(Serie serie) async {
  Database db = await getDatabase();
  return db.insert('series', serie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Map>> findall() async {
  Database db = await getDatabase();
  List<Map<String, dynamic>> dados = await db.query('series');

  dados.forEach((serie) {
    print(serie);
  });

  return dados;
}

Future<int> deleteById(int id) async {
  debugPrint('Deletando o ID');
  Database db = await getDatabase();
  return db.delete('series', where: 'id = ?', whereArgs: [id]);
}
