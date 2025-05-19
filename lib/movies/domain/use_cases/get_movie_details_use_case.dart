import 'package:dartz/dartz.dart';
import 'package:movie/core/exceptions/failure/failure.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/use_cases/base_use_cases.dart';

class GetMovieDetailsUseCase extends BaseUseCases<MovieDetailsModel> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetailsModel>> call() async =>
      await baseMovieRepository.getMovieDetails();
}
