import 'dart:convert';

class Estado {
  int id;
  String uf;
  String nome;
  Estado({
    required this.id,
    required this.uf,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uf': uf,
      'nome': nome,
    };
  }

  factory Estado.fromMap(Map map) {
    return Estado(
      id: map['id'] ?? map[0] ?? -1,
      uf: map['sigla'] ?? map[1] ?? '',
      nome: map['nome'] ?? map[2] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Estado.fromJson(Map source) => Estado.fromMap(source);

  @override
  String toString() => 'Estado(id: $id, uf: $uf, nome: $nome)';

  Estado copyWith({
    int? id,
    String? uf,
    String? nome,
  }) {
    return Estado(
      id: id ?? this.id,
      uf: uf ?? this.uf,
      nome: nome ?? this.nome,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Estado &&
        other.id == id &&
        other.uf == uf &&
        other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ uf.hashCode ^ nome.hashCode;
}
