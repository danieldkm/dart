import 'dart:convert';

class CidadeMaisFacil {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;
  CidadeMaisFacil({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  factory CidadeMaisFacil.fromMap(Map<String, dynamic> map) {
    return CidadeMaisFacil(
      cep: map['cep'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
      ddd: map['ddd'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadeMaisFacil.fromJson(String source) =>
      CidadeMaisFacil.fromMap(json.decode(source));
}
