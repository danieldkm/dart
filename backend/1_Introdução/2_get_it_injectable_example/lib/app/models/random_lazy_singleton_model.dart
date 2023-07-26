import 'dart:math';

import 'package:injectable/injectable.dart';

@lazySingleton
class RandomLazySingletonModel {
  int id;
  String name;

  RandomLazySingletonModel()
      : id = Random().nextInt(1000),
        name = 'RandomLazySingletonModel' {
    print('name: $name, id: $id');
  }
}
