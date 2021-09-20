// Este ***main*** ja é considerada uma MicroTask
import 'dart:async';

void main(List<String> args) {
  print('Inicio Main');
  scheduleMicrotask(() => print('Microtask #1'));
  Future.delayed(Duration(seconds: 1), () => print('Future #1 delayed'));
  Future(() => print('Future #2'));
  Future(() => print('Future #3'));

  scheduleMicrotask(() => print('Microtask #2'));
  print('Fim Main');
}

/// Event
/// Future.dalayed
/// Future #2
/// Future #3
/// 
/// 
/// MicroTask
/// Main
/// MicroTask #1
/// MicroTask #2