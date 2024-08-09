class Serie {
  int id;
  String nome;
  double progresso;
  int avaliacao;

  Serie({
    required this.id,
    required this.nome,
    required this.progresso,
    required this.avaliacao,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'progresso': progresso,
      'avaliacao': avaliacao,
    };
  }

  static Serie fromMap(Map<String, Object?> mapa) {
    return Serie(
      id: int.parse(mapa['id'].toString()),
      nome: mapa['nome'].toString(),
      progresso: double.parse(mapa['progresso'].toString()),
      avaliacao: int.parse(mapa['avaliacao'].toString()),
    );
  }

  @override
  String toString() {
    return 'Serie: {ID: $id, Nome: $nome, Progresso: $progresso, Avaliacao: $avaliacao}';
  }
}
