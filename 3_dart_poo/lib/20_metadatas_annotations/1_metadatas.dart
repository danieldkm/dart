import 'dart:mirrors';

import 'fazer.dart';
import 'pessoa.dart';

void main(List<String> args) {
  final p1 = Pessoa();

  var instanceMirror = reflect(p1);
  print(instanceMirror.reflectee);

  var classMirror = instanceMirror.type;
  classMirror.metadata.forEach((annotation) {
    var instaceAnnotation = annotation.reflectee;
    if (instaceAnnotation is Fazer) {
      print('Classes!!');
      print('Quem: ${instaceAnnotation.quem}');
      print('O que: ${instaceAnnotation.oque}');
    }
  });

  classMirror.declarations.values.forEach((declarationMirror) {
    if (declarationMirror is VariableMirror) {
      declarationMirror.metadata.forEach((annotation) {
        var instaceAnnotation = annotation.reflectee;
        if (instaceAnnotation is Fazer) {
          print('Variáveis!!');
          print('Quem: ${instaceAnnotation.quem}');
          print('O que: ${instaceAnnotation.oque}');
        }
      });
    } else if (declarationMirror is MethodMirror) {
      declarationMirror.metadata.forEach((annotation) {
        var instaceAnnotation = annotation.reflectee;
        if (instaceAnnotation is Fazer) {
          print('Métodos!!');
          print('Quem: ${instaceAnnotation.quem}');
          print('O que: ${instaceAnnotation.oque}');
        }
      });
    }
  });
}
