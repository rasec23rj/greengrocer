String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email/ou Senha inválidos';

    case 'Invalid session token':
      return 'Token inválido';

    case 'Account already exists for this username.':
      return 'Usuário já cadastrado';

    case 'INVALID_FULLNAME':
      return 'Nome inválido';

    case 'INVALID_PHONE':
      return 'Celular inválido';

    case 'INVALID_CPF':
      return 'cpf inválido';

    default:
      return 'um error indefinido ocorreu';
  }
}
