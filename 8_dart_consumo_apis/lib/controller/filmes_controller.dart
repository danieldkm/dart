import 'package:dart_consumo_apis/models/filme.dart';
import 'package:dart_consumo_apis/repositories/filmes_repository.dart';

class FilmesController {
  final _filmesRepository = FilmesRepository();

  Future<void> findAll() async {
    final filmes = await _filmesRepository.findAll();
    filmes.forEach(print);
  }

  Future<Filme> findById(String id) async {
    final filme = await _filmesRepository.findById(id);
    print(filme);
    return filme;
  }

  Future<void> update(String id) async {
    final filme = await findById(id);
    filme.genreIds.add(123);
    await _filmesRepository.update(filme);
  }

  Future<void> insert() async {
    final filme = Filme(
      adult: false,
      backdropPath: ".png",
      genreIds: [1, 2, 3],
      originalLanguage: "br",
      originalTitle: "Aprenda a aprender",
      overview: "vai que vai",
      popularity: 123,
      posterPath: ".png",
      releaseDate: DateTime.now(),
      title: "Aprenda a aprender",
      video: false,
      voteAverage: 10.0,
      voteCount: 1,
    );
    await _filmesRepository.insert(filme);
  }
}
