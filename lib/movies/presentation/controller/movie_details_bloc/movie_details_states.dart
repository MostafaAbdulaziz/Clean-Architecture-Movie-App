import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums/enums_states_request.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<RecommendationModel> movieRecommendations;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<RecommendationModel>? movieRecommendations,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsMessage,
  }) => MovieDetailsState(
    movieDetails: movieDetails ?? this.movieDetails,
    movieDetailsRequestState:
        movieDetailsRequestState ?? this.movieDetailsRequestState,
    movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    movieRecommendations: movieRecommendations ?? this.movieRecommendations,
    movieRecommendationsRequestState:
        movieRecommendationsRequestState ??
        this.movieRecommendationsRequestState,
    movieRecommendationsMessage:
        movieRecommendationsMessage ?? this.movieRecommendationsMessage,
  );

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecommendations = const <RecommendationModel>[],
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsMessage = '',
  });
  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsRequestState,
    movieDetailsMessage,
    movieRecommendations,
    movieRecommendationsRequestState,
    movieRecommendationsMessage,
  ];
}
