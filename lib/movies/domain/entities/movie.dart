import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final List<int> genreIds;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    backdropPath,
    id,
    title,
    genreIds,
    overview,
    voteAverage,
    releaseDate,
  ];
}
