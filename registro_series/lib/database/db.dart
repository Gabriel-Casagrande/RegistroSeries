import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String caminhoBanco = join(await getDatabasesPath(), 'serie.db');

  return openDatabase(
    caminhoBanco,
    version: 1,
    onCreate: (db, version) {
      db.execute('CREATE TABLE series('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'progresso DECIMAL, '
          'avaliacao INTEGER)');

      db.execute('CREATE TABLE episodios('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'tempo DECIMAL, '
          'avaliacao INTEGER)');

      db.execute('CREATE TABLE series_episodios('
          'id_serie INTENGER '
          'id_episodio INTENGER '
          'FOREIGN KEY(id_serie) REFERENCES series(id) '
          'FOREIGN KEY(id_episodio) REFERENCES episodios(id) '
          'PRIMARY KEY (id_serie, id_episodio))');
    },
  );
}
