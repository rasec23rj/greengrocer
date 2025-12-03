import 'package:greengrocer/src/core/constants/endpoint.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/result/auth_errors.dart'
    as auth_erros;
import 'package:greengrocer/src/screens/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoint.signin,
      method: HttpMethods.post,
      body: {"email": email, "password": password},
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(auth_erros.authErrorsString(result['error']));
    }
  }
}
