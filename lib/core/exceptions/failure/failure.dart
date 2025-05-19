import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({required super.message});
}

// class FailureMessage {
//   static getFailureMessage(Failure failure) => failure.message;
// }
