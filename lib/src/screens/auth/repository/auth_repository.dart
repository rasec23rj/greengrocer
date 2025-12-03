import 'package:greengrocer/src/core/constants/endpoint.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoint.signin,
      method: HttpMethods.post,
      body: {"email": email, "password": password},
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return user;
    } else {
      print("error $result");
      return result['error'];
    }
  }
}
