import 'dart:math';

import 'package:injectable/injectable.dart';

@injectable
class RandomFactoryModel {
  int id;
  String name;

  RandomFactoryModel()
      : id = Random().nextInt(1000),
        name = 'RandomFactoryModel' {
    print('name: $name, id: $id');
  }
}
