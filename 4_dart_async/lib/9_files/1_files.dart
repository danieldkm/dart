import 'dart:io';

Future<void> main(List<String> args) async {
  var file = File('lib/9_files/files/file.txt');
  // Leitura Sincrona
  var fileDataS = file.readAsStringSync();
  print(fileDataS);
  // Leitura Assincrona
  var fileDataAs = await file.readAsString();
  print(fileDataAs);
  // Leitura linha sincrona
  var fileDataListaS = file.readAsLinesSync();
  print(fileDataListaS);
  // Leitura linha assincrona
  var fileDataListaAs = await file.readAsLines();
  print(fileDataListaAs);

  // Escrita
  var file2 = File('lib/9_files/files/file2.txt');
  await file2.writeAsString('Academia do Flutter Async \n');
  await file2.writeAsString('Academia do Flutter Async 2 \n',
      mode: FileMode.append);
  file2.writeAsStringSync('Academia do Flutter Sync\n', mode: FileMode.append);

  var listaNomes = ['Daniel', 'Cleiton', 'Joao', 'Leonardo', 'Julio'];
  var file3 = File('lib/9_files/files/file3.txt');
  // var writeFile = file3.openWrite();
  var writeFile2 = file3.openWrite(mode: FileMode.append);

  // listaNomes.forEach((nome) => writeFile.write('$nome\n'));
  // listaNomes.forEach((nome) => writeFile.writeln(nome));

  listaNomes.forEach((nome) => writeFile2.write('$nome\n'));
  listaNomes.forEach((nome) => writeFile2.writeln(nome));
}
