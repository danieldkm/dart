import 'package:crypto/crypto.dart';
import 'dart:convert';

class CryptUtils {
  CryptUtils._();

  static String generateSha256Hash(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }
}
