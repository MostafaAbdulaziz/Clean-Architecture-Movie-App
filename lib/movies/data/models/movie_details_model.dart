import 'package:movie/movies/data/models/genres_model.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: checkPicture(json['backdrop_path']),
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
        genres: convertToGenresGroup(json['genres']),
      );
}

List<GenresModel> convertToGenresGroup(List<dynamic> genres) =>
    List.from(genres.map((genre) => GenresModel.fromJson(genre)).toList());
