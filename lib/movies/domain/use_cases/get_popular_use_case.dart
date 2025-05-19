import 'package:dartz/dartz.dart' show Either;
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/use_cases/base_use_cases.dart';

import '../../../core/exceptions/failure/failure.dart';
import '../../data/models/movie_model.dart' show MovieModel;

class GetPopularUseCase implements BaseUseCases<List<MovieModel>> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MovieModel>>> call() async =>
      await baseMovieRepository.getPopularMovies();
}
