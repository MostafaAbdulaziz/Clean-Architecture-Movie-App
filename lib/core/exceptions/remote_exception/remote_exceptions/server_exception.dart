import 'package:movie/core/exceptions/remote_exception/models_remote_exceptions/error_model.dart';

class ServerException implements Exception {
  final ErrorServerModel errorServerModel;
  ServerException({required this.errorServerModel});
}
