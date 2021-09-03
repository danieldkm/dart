import 'package:dart_poo/7_polimorfismo/residente_anestesista.dart';

import 'anestesista.dart';
import 'medico.dart';
import 'obstetra.dart';
import 'pediatra.dart';

void main(List<String> args) {
  var medicos = <Medico>[
    ResidenteAnestesista(),
    Anestesista(),
    Obstetra(),
    Pediatra(),
  ];

  for (var medico in medicos) {
    medico.operar();
  }
}
