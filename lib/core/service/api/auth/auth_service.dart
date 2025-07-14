import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../index.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ServiceConstants.authBaseUrl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  //TODO: Mock API to showcase Success case
  @GET(ServiceConstants.signInPathSuccess)
  Future<ApiResponse> signInSuccess({
    required String userName,
    required String password,
  });

  //TODO: Mock API to showcase Failure case
  @GET(ServiceConstants.signInPathFailure)
  Future<ApiResponse> signInFailure({
    required String userName,
    required String password,
  });
}
