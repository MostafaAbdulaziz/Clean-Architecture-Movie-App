import 'package:dio/dio.dart';
import 'package:movie/core/network/dio_helper/dio_helper.dart';

Future<Response> getData({required String api}) async => await dio.get(api);
