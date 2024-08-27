import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String caminhoBanco = join(
      await getDatabasesPath(), 'BANCODEDADOSDIGITALABRASUACONTAAGORAMESMO.db');

  return openDatabase(caminhoBanco, version: 1, onCreate: (db, version) async {
    await db.execute('''
    CREATE TABLE series (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      progresso REAL NOT NULL,
      avaliacao INTEGER NOT NULL,
      sinopse TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS episodios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      tempo INTEGER NOT NULL,
      episodio INTEGER NOT NULL,
      temporada INTEGER NOT NULL,
      serie_id INTEGER NOT NULL,
      FOREIGN KEY (serie_id) REFERENCES series(id)
    )
  ''');

    if (kDebugMode) {
      print('Inserindo séries e episódios iniciais...');
    }
    insertTodasSeries();
    insertTodosEpisodios();
    if (kDebugMode) {
      print('Inserção concluída.');
    }
  });
}
