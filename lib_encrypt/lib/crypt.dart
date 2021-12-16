import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class MontaDadosTmovPay {
  final String documento_destino;
  final String senha;
  final String valor;

  MontaDadosTmovPay({
    required this.documento_destino,
    required this.senha,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'documento_destino': documento_destino,
      'senha': senha,
      'valor': valor,
    };
  }

  factory MontaDadosTmovPay.fromMap(Map<String, dynamic> map) {
    return MontaDadosTmovPay(
      documento_destino: map['documento_destino'] ?? '',
      senha: map['senha'] ?? '',
      valor: map['valor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MontaDadosTmovPay.fromJson(String source) =>
      MontaDadosTmovPay.fromMap(json.decode(source));
}

abstract class Crypt {
  static String encrypt() {
    // var key = Key.fromUtf8(utf8
    //     .encode('@okGKxH0Zng3E9AvTa9zABDThOx0nFNe842')
    //     .toString()); //TODO DEIXAR FROTISTA_ID DINAMICO
    // final key = Key.fromUtf8('@okGKxH0Zng3E9AvTa9zABDThOx0nFNe');
    // final iv = IV.fromUtf8('3987154896321475');
    final key = Key.fromBase64('MTIzNDU2');
    final iv = IV.fromBase64('MTIzNDU2');
    var encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(
      'teste',
      // jsonEncode(
      //   MontaDadosTmovPay.fromJson(
      //       '{"documento_destino":"96057548191","senha":"6311","valor":"1"}'),
      // ),
      iv: iv,
    );
    return encrypted.base64;
  }
}
