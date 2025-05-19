import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/use_cases/base_use_cases.dart';

import '../../../core/exceptions/failure/failure.dart';
import '../../data/models/movie_model.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedUseCase implements BaseUseCases<List<MovieModel>> {
  final BaseMovieRepository baseMovieRepository;
  GetTopRatedUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MovieModel>>> call() async =>
      await baseMovieRepository.getTopRatedMovies();
}
