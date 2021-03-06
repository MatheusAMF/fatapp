class AppException implements Exception {
  final _message;

  AppException([this._message]);

  String toString() {
    return this._message;
  }
}

class InternalException extends AppException {
  InternalException() : super("Erro interno");
}

class LoginException extends AppException {
  LoginException() : super("Usuário não encontrado");
}

class ValidationException extends AppException {
  ValidationException([message]) : super(message);
}
