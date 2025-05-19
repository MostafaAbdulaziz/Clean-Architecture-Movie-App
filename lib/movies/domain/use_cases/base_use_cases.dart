import 'package:dartz/dartz.dart';

import '../../../core/exceptions/failure/failure.dart';

abstract class BaseUseCases<T> {
  Future<Either<Failure, T>> call();
}
