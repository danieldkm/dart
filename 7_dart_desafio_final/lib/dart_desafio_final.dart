import 'repositories/http/cidade_repository.dart' as cidade_repository_http;
import 'repositories/mysql/cidade_repository.dart';
import 'repositories/http/estado_repository.dart' as estado_repository_http;
import 'repositories/mysql/estado_repository.dart';

void main(List<String> args) async {
  var estadoRepositoryHttp = estado_repository_http.EstadoRepository();
  final apiEstados = await estadoRepositoryHttp.findAll();
  var estadoRepository = EstadoRepository();
  await estadoRepository.addAll(apiEstados);

  final estados = await estadoRepository.findAll();
  await estadoRepository.dispose();

  final cidadeRepositoryHttp = cidade_repository_http.CidadeRepository();
  final cidadeRepository = CidadeRepository();
  for (var estado in estados) {
    final cidades = await cidadeRepositoryHttp.findAll(estado.id);
    await cidadeRepository.addAll(cidades);
  }
  await cidadeRepository.dispose();
}
