import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({
    required this.milliseconds,
  });

  void call(VoidCallback callback) {
    if (_timer?.isActive ?? false) {
      _timer!.cancel();
    }
    _timer = Timer(
      Duration(milliseconds: milliseconds),
      callback,
    );
  }
}
