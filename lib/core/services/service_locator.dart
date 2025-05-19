import 'package:get_it/get_it.dart';
import 'package:movie/movies/data/data_source/remote/concrete_class.dart';
import 'package:movie/movies/data/data_source/remote/get_movies_data.dart';
import 'package:movie/movies/data/repository/movie_repo.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_recommendation_movie_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../../movies/domain/use_cases/get_popular_use_case.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  static void init() {
    /// data source
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(
      () => GetMoviesData(),
    );

    /// repository
    serviceLocator.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(serviceLocator()),
    );

    /// useCases
    serviceLocator.registerLazySingleton<GetNowPlayingUseCase>(
      () => GetNowPlayingUseCase(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<GetPopularUseCase>(
      () => GetPopularUseCase(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<GetTopRatedUseCase>(
      () => GetTopRatedUseCase(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(serviceLocator()),
    );
    serviceLocator.registerLazySingleton<GetRecommendationMovieUseCase>(
      () => GetRecommendationMovieUseCase(serviceLocator()),
    );

    /// Bloc
    serviceLocator.registerFactory(
      () => MovieBloc(serviceLocator(), serviceLocator(), serviceLocator()),
    );
    serviceLocator.registerFactory(
      () => MovieDetailsBloc(serviceLocator(), serviceLocator()),
    );
  }
}
