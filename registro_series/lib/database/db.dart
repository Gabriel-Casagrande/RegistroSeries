import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String caminhoBanco = join(await getDatabasesPath(), 'serie.db');

  return openDatabase(
    caminhoBanco,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('CREATE TABLE series('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'progresso REAL, ' // Correção para REAL
          'avaliacao INTEGER)');

      await db.execute('CREATE TABLE episodios('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'tempo REAL, ' // Correção para REAL
          'avaliacao INTEGER)');

      await db.execute('CREATE TABLE series_episodios('
          'id_serie INTEGER, '
          'id_episodio INTEGER, '
          'FOREIGN KEY(id_serie) REFERENCES series(id), '
          'FOREIGN KEY(id_episodio) REFERENCES episodios(id), '
          'PRIMARY KEY (id_serie, id_episodio))');

      // Inserir dados iniciais na tabela series
      await db.insert('series',
          {'id': 1, 'nome': 'Série 1', 'progresso': 0.7, 'avaliacao': 4});
      await db.insert('series',
          {'id': 2, 'nome': 'Série 2', 'progresso': 0.5, 'avaliacao': 3});
      await db.insert('series',
          {'id': 3, 'nome': 'Série 3', 'progresso': 0.9, 'avaliacao': 5});
    },
  );
}
