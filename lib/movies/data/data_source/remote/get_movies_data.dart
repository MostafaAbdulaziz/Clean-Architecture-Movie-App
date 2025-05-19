import 'package:movie/movies/data/data_source/remote/Common_functions/get_movies.dart';
import 'package:movie/movies/data/data_source/remote/Common_functions/set_server_exception.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';

import '../../../../core/network/constants/api_constants.dart';
import '../../../../core/network/dio_helper/dio_get.dart';
import 'concrete_class.dart';

class GetMoviesData extends BaseRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async =>
      await GetMovies(api: Apis.newPlayingApi).getMovies();

  @override
  Future<List<MovieModel>> getPopular() async =>
      await GetMovies(api: Apis.popularApi).getMovies();

  @override
  Future<List<MovieModel>> getTopRated() async =>
      await GetMovies(api: Apis.topRatedApi).getMovies();

  @override
  Future<MovieDetailsModel> getMovieDetails() async {
    final response = await getData(api: Apis.movieDetailsApi(Apis.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw setServerException(response);
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationsMovie() async {
    final response = await getData(
      api: Apis.recommendationsMovieApi(Apis.movieId),
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        response.data['results'].map(
          (movie) => RecommendationModel.fromJson(movie),
        ),
      );
    } else {
      throw throw setServerException(response);
    }
  }
}
