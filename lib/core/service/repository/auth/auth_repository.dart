import '../../../index.dart';

abstract class AuthRepository {
  Future<ApiResponse> signIn({
    required String userName,
    required String password,
  });
}
