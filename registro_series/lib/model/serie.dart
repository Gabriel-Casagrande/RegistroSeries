import 'dart:ffi';

class Serie {
  int? id;
  String? nome;
  Float? progresso;
  int? avaliacao;

  Serie(
      {this.id,
      required this.nome,
      required this.progresso,
      required this.avaliacao});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'progresso': progresso,
      'avaliacao': avaliacao
    };
  }

  String toSring() {
    return 'Serie: {ID: $id, Nome: $nome, Progresso: $progresso, Avaliacao: $avaliacao}';
  }
}
