import 'Banana.dart';
import 'fruta.dart';
import 'humano.dart';
import 'macaco.dart';

void main(List<String> args) {
  var humano = Humano();
  humano.comer(Fruta());

  var macaco = Macaco();
  macaco.comer(Banana('nanica'));
}
