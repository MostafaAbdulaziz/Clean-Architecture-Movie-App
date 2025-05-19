import 'package:dio/dio.dart';
import 'package:movie/movies/data/data_source/remote/Common_functions/set_server_exception.dart';

import '../../../../../core/network/dio_helper/dio_get.dart';
import '../../../models/movie_model.dart';

class GetMovies {
  final String api;
  GetMovies({required this.api});
  Future<List<MovieModel>> getMovies() async {
    final response = await getData(api: api);
    if (response.statusCode == 200) {
      return _createListOfMovieModel(response);
    } else {
      throw throw setServerException(response);
    }
  }
}

List<MovieModel> _createListOfMovieModel(Response<dynamic> response) =>
    List<MovieModel>.from(
      response.data['results'].map((movie) {
        return MovieModel.fromJson(movie);
      }),
    );
