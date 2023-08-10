import 'dart:io';

class DotEnvService {
  final Map<String, String> _map = {};

  DotEnvService({Map<String, String>? mocks}) {
    if (mocks == null) {
      _init();
    } else {
      _map.addAll(mocks);
    }
  }

  void _init() {
    // var dir = Directory.current.path;
    // print('dir========$dir');
    // if (dir.endsWith('/test')) {
    //   dir = dir.replaceAll('/test', '');
    // }
    final file = File('.env');
    final envText = file.readAsStringSync();

    for (var line in envText.split('\n')) {
      if (line.isEmpty) {
        continue;
      }

      final lineBreak = line.split('=');
      if (lineBreak.length != 2) {
        continue;
      }
      _map[lineBreak[0]] = lineBreak[1].trim();
    }
  }

  String? operator [](String key) {
    return _map[key];
  }
}
