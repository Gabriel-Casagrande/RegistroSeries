import 'package:path/path.dart';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String caminhoBanco = join(await getDatabasesPath(), 'sefudeewewew.db');

  return openDatabase(caminhoBanco, version: 1, onCreate: (db, version) async {
    await db.execute('CREATE TABLE series('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT, '
        'progresso DECIMAL, '
        'avaliacao INTEGER, '
        'sinopse TEXT)');

    await db.execute('CREATE TABLE episodios('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT, '
        'tempo TEXT, '
        'episodio INTEGER, '
        'temporada INTEGER)');

    await db.execute('CREATE TABLE series_episodios('
        'id_serie INTEGER, '
        'id_episodio INTEGER, '
        'FOREIGN KEY(id_serie) REFERENCES series(id), '
        'FOREIGN KEY(id_episodio) REFERENCES episodios(id), '
        'PRIMARY KEY (id_serie, id_episodio))');

    insertTodasSeries();
  });
}
