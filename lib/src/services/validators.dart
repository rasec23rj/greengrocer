import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite um email';
  }
  if (!email.isEmail) return 'Digite um email válido';
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite uma senha';
  }
  if (password.length <= 7)
    return 'Digite uma senha com no minimo de 7. carcteres';

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite uma telefone';
  }

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite uma cpf';
  }

  return null;
}
