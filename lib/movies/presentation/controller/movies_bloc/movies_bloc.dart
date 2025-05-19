import 'package:bloc/bloc.dart';
import 'package:movie/core/utils/enums/enums_states_request.dart';
import 'package:movie/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_popular_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie/movies/presentation/controller/movies_bloc/movies_states.dart';

import 'movies_events.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  MovieBloc(
    this.getNowPlayingUseCase,
    this.getPopularUseCase,
    this.getTopRatedUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  Future _getNowPlayingMovies(
    GetNowPlayingEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingUseCase();
    result.fold(
      (errorData) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: errorData.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          nowPlayingMovies: movies,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  Future _getPopularMovies(
    GetPopularEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularUseCase();
    result.fold(
      (errorData) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: errorData.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          popularMovies: movies,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  Future _getTopRatedMovies(
    GetTopRatedEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedUseCase();
    result.fold(
      (errorData) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: errorData.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          topRatedMovies: movies,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
