import 'package:dartz/dartz.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';
import 'package:movie/movies/data/repository/common_repo_functions/get_movies_repo.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';

import '../../../core/exceptions/failure/failure.dart';
import '../../../core/exceptions/remote_exception/remote_exceptions/server_exception.dart';
import '../data_source/remote/concrete_class.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  MovieRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async =>
      await GetMoviesRepo(
        movies: await baseRemoteDataSource.getNowPlayingMovies(),
      ).getMoviesRepo();

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async =>
      await GetMoviesRepo(
        movies: await baseRemoteDataSource.getPopularMovies(),
      ).getMoviesRepo();

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async =>
      await GetMoviesRepo(
        movies: await baseRemoteDataSource.getTopRatedMovies(),
      ).getMoviesRepo();

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails() async {
    final result = await baseRemoteDataSource.getMovieDetails();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationModel>>>
  getRecommendationsMovie() async {
    final result = await baseRemoteDataSource.getRecommendationsMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.errorServerModel.statusMessage));
    }
  }
}
