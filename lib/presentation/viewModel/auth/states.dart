
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String message;
  LoginSuccess({required this.message});
}
class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});
}

class LoginError extends AuthState {
  final String error;
  LoginError({required this.error});
}

class RegisterError extends AuthState {
  final String error;
  RegisterError({required this.error});
}
