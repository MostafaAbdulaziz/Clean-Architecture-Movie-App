import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';

import '../../models/movie_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails();
  Future<List<RecommendationModel>> getRecommendationsMovies();
}
