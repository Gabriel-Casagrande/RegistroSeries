class Serie {
  int? id;
  String? nome;
  double? progresso;
  int? avaliacao;

  Serie({
    this.id,
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

  static Serie fromMap(Map<String, Object?> map) {
    return Serie(
      id: map['id'] as int?,
      nome: map['nome'] as String?,
      progresso: map['progresso'] as double?,
      avaliacao: map['avaliacao'] as int?,
    );
  }

  @override
  String toString() {
    return 'Serie: {ID: $id, Nome: $nome, Progresso: $progresso, Avaliacao: $avaliacao}';
  }
}
