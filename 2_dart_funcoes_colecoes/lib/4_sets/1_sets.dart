void main(List<String> args) {
  var numerosLista = <int?>[];
  numerosLista.add(1);
  numerosLista.add(2);
  numerosLista.add(3);
  numerosLista.add(3);
  numerosLista.add(1);
  numerosLista.add(2);
  numerosLista.add(null);
  print(numerosLista);

  var numerosSet = <int?>{};
  numerosSet.add(1);
  numerosSet.add(2);
  numerosSet.add(3);
  numerosSet.add(3);
  numerosSet.add(1);
  numerosSet.add(2);
  numerosSet.add(null);
  print(numerosSet);
  print('.toSet()');
  print(numerosLista.toSet());

  numerosSet.forEach(print);

  var numeros1 = {1, 2, 3, 4, 5, 6};
  var numeros2 = {1, 3, 4, 7};

  print('.difference()');
  print(numeros1.difference(numeros2));
  print(numeros2.difference(numeros1));

  print('.union()');
  print(numeros1.union(numeros2));

  print('.intersection()');
  print(numeros1.intersection(numeros2));

  var nomes1 = {'Daniel', 'Keyti', 'Morita'};
  var nomes2 = {'Daniel', 'Vinicius', 'Leonardo'};
  print(nomes1.intersection(nomes2));

  print('.lookup()');
  print(numeros1.lookup(1));
  print(numeros1.lookup(99));
  print(nomes1.lookup('Daniel'));
  print(nomes1.lookup('daniel'));

// nomes1[0] not work
  nomes1.elementAt(0);
}
