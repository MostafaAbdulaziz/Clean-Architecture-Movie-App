import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';

import '../../models/movie_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailsModel> getMovieDetails();
  Future<List<RecommendationModel>> getRecommendationsMovie();
}
