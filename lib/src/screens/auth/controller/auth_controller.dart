import 'package:get/get.dart';
import 'package:greengrocer/src/core/config/app_pages.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/screens/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/util_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final _authRepository = AuthRepository();
  UserModel user = UserModel();
  final utilServices = UtilServices();

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result = await _authRepository.signIn(
      email: email,
      password: password,
    );
    result.when(
      success: (user) {
        print(user);
        Get.offAllNamed(Routes.base);
        utilServices.showToast(message: 'Seja bem vindo! ${user.name}');
        isLoading.value = false;
      },
      error: (message) {
        utilServices.showToast(message: message, isError: true);
        isLoading.value = false;
      },
    );
  }
}
