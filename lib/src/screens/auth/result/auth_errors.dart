String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email/ou Senha inválidos';
    case 'Invalid session token':
      return 'Token inválido';
    default:
      return 'um error indefinido ocorreu';
  }
}
