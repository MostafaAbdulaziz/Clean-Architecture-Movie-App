import '../../../core/network/pictures/pictures_url.dart';
import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    backdropPath: checkPicture(json['backdrop_path']),
    id: json['id'],
    title: json['title'],
    genreIds: List<int>.from(json['genre_ids']),
    overview: json['overview'],
    voteAverage: json['vote_average'],
    releaseDate: json['release_date'],
  );
}

String checkPicture(String? picturePath) =>
    picturePath ?? PictureUrl.pictureMovieUrl;
