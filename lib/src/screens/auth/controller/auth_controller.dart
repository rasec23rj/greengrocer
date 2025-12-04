import 'package:get/get.dart';
import 'package:greengrocer/src/core/config/app_pages.dart';
import 'package:greengrocer/src/core/constants/endpoint.dart';
import 'package:greengrocer/src/core/constants/storege_key.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/screens/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/util_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final _authRepository = AuthRepository();
  UserModel user = UserModel();
  final utilServices = UtilServices();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  Future<void> validateToken() async {
    String? token = await utilServices.loadLocalData(key: StoregeKey.token);
    if (token == null) return Get.offAllNamed(Endpoint.signin);
    AuthResult result = await _authRepository.validateToken(token);
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    await utilServices.removeLocalData(key: StoregeKey.token);
    user = UserModel();
    return Get.offAllNamed(Routes.signin);
  }

  void saveTokenAndProceedToBase() {
    utilServices.saveLocalData(key: StoregeKey.token, data: user.token!);
    Get.offAllNamed(Routes.base);
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result = await _authRepository.signIn(
      email: email,
      password: password,
    );
    result.when(
      success: (user) {
        this.user = user;
        validateToken();
        utilServices.showToast(message: 'Seja bem vindo! ${user.name}');
        isLoading.value = false;
      },
      error: (message) {
        utilServices.showToast(message: message, isError: true);
        isLoading.value = false;
      },
    );
  }

  Future<void> signUp(UserModel user) async {
    isLoading.value = true;

    AuthResult result = await _authRepository.signup(user);

    result.when(
      success: (user) {
        this.user = user;
        validateToken();
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
