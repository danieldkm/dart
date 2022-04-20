import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd']?.toInt() ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Telefone.fromJson(String source) =>
      Telefone.fromMap(json.decode(source));

  @override
  String toString() => 'Telefone(ddd: $ddd, telefone: $telefone)';
}
