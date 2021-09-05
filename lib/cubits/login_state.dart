abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}