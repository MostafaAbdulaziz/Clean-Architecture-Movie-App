import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure/failure.dart';
import '../../../../core/exceptions/remote_exception/remote_exceptions/server_exception.dart';
import '../../models/movie_model.dart';

class GetMoviesRepo {
  final List<MovieModel> movies;
  GetMoviesRepo({required this.movies});

  Future<Either<Failure, List<MovieModel>>> getMoviesRepo() async {
    final result = movies;
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.errorServerModel.statusMessage));
    }
  }
}
