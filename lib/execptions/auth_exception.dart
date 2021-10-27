class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_NOT_FOUND': 'email não encontrado',
    'INVALID_PASSWORD': 'Senha Invalida',
    'USER_DISABLED': 'Usuario Desabilitado',
    'EMAIL_EXISTS': 'Email já existe',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Acesso Bloqueado temporariamente, Tente mais Tarde',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Erro ao autenticar';
  }
}
