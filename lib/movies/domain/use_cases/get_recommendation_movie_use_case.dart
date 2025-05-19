import 'package:dartz/dartz.dart';
import 'package:movie/movies/data/models/recommendation_model.dart';

import '../../../core/exceptions/failure/failure.dart';
import '../repository/base_movie_repository.dart';
import 'base_use_cases.dart';

class GetRecommendationMovieUseCase
    implements BaseUseCases<List<RecommendationModel>> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<RecommendationModel>>> call() async =>
      await baseMovieRepository.getRecommendationsMovie();
}
