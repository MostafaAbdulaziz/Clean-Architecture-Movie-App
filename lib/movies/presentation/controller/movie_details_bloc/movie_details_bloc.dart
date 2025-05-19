import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums/enums_states_request.dart';
import 'package:movie/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_recommendation_movie_use_case.dart';
import 'package:movie/movies/presentation/controller/movie_details_bloc/movie_details_events.dart';
import 'package:movie/movies/presentation/controller/movie_details_bloc/movie_details_states.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMovieUseCase getRecommendationMovieUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationMovieUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getMovieRecommendations);
  }
  Future _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUseCase();
    result.fold(
      (left) => emit(
        state.copyWith(
          movieDetailsMessage: left.message,
          movieDetailsRequestState: RequestState.error,
        ),
      ),
      (right) => emit(
        state.copyWith(
          movieDetails: right,
          movieDetailsRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  Future _getMovieRecommendations(
    GetRecommendationsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getRecommendationMovieUseCase();
    result.fold(
      (left) => emit(
        state.copyWith(
          movieRecommendationsMessage: left.message,
          movieRecommendationsRequestState: RequestState.error,
        ),
      ),
      (right) => emit(
        state.copyWith(
          movieRecommendations: right,
          movieRecommendationsRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
