void main(List<String> args) {
  print('Iniciou o processo');
  for (var i = 0; i < 5; i++) {
    print(i);
  }
  m2();
  p2();
  print('finalizou');
}

void m2() {
  print('função m2');
}

void p2() {
  Future.delayed(Duration(seconds: 2), () {
    print('processo 2 sendo executado');
  });
}
