import 'package:dartz/dartz.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';

import '../../../core/exceptions/failure/failure.dart';
import '../../data/models/movie_model.dart';

//concrete class

abstract class BaseMovieRepository {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails();
  Future<Either<Failure, List<RecommendationModel>>> getRecommendationsMovie();
}
