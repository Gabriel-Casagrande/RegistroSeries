// ignore_for_file: non_constant_identifier_names

class Episodio {
  int? id;
  String nome;
  int tempo;
  int episodio;
  int temporada;
  int? serie_id;

  Episodio(
      {this.id,
      required this.nome,
      required this.tempo,
      required this.episodio,
      required this.temporada,
      this.serie_id});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tempo': tempo,
      'episodio': episodio,
      'temporada': temporada,
      'serie_id': serie_id
    };
  }

  static Episodio fromMap(Map<String, Object?> mapa) {
    return Episodio(
        id: int.parse(mapa['id'].toString()),
        nome: mapa['nome'].toString(),
        tempo: int.parse(mapa['tempo'].toString()),
        episodio: int.parse(mapa['episodio'].toString()),
        temporada: int.parse(mapa['temporada'].toString()),
        serie_id: int.parse(mapa['serie_id'].toString()));
  }

  @override
  String toString() {
    return 'Serie: {ID: $id, Nome: $nome, Tempo: $tempo, Episodio: $episodio, Temporada: $temporada, Serie_id: $serie_id}';
  }
}
