import 'package:seasalt/cubits/login_cubit.dart';

/// A generic empty class to hold state for [LoginCubit].
abstract class LoginState {}

/// The state when [LoginCubit] has just been loaded.
class LoginInitial extends LoginState {}

/// The state when [LoginCubit] is currently loading.
class LoginLoading extends LoginState {}

/// The state when [LoginCubit] has successfully logged the user in.
class LoginSuccess extends LoginState {}

/// The state when [LoginCubit] has failed to log the user in.
class LoginError extends LoginState {
  /// An error message to present to users to tell them what went wrong.
  final String message;

  LoginError({required this.message});
}