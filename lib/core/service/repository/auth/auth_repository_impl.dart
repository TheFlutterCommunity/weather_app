import 'package:dio/dio.dart';

import '../../../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  late final AuthService _authService = AuthService(
    Dio(),
    baseUrl: ServiceConstants.authBaseUrl,
  );

  //TODO: Adding hardcoded check and returning hardcoded UserDetails model
  /// This is just for demo
  @override
  Future<ApiResponse> signIn({
    required String userName,
    required String password,
  }) async {
    /// Using mock API so will call success and failed cases by adding hardcoded check
    if (userName == kUserNameValue && password == kPasswordValue) {
      return _authService.signInSuccess(userName: userName, password: password);
    } else {
      final response = await _authService.signInFailure(
        userName: userName,
        password: password,
      );

      if (response.userDetails == null) {
        throw AuthException(message: kInvalidCredentials);
      } else {
        throw AuthException(message: kError);
      }
    }
  }
}
