String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email/ou Senha inválidos';
    default:
      return 'um error indefinido ocorreu';
  }
}
