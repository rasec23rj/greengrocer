import 'package:get/get.dart';
import 'package:greengrocer/src/core/config/app_pages.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final _authRepository = AuthRepository();
  UserModel user = UserModel();

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    final user = await _authRepository.signIn(email: email, password: password);
    this.user = user;
    Get.offAllNamed(Routes.base);

    isLoading.value = false;
  }
}
