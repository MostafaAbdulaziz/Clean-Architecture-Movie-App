import 'package:dio/dio.dart';

import '../../../../../core/exceptions/remote_exception/models_remote_exceptions/error_model.dart';
import '../../../../../core/exceptions/remote_exception/remote_exceptions/server_exception.dart';

ServerException setServerException(Response<dynamic> response) =>
    ServerException(errorServerModel: ErrorServerModel.fromJson(response.data));
