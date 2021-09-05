import 'package:bloc/bloc.dart';

import 'package:seasalt/cubits/login_state.dart';
import 'package:seasalt/repositories/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginCubit({required this.repository}) : super(LoginInitial());

  Future<void> login(String username, String password) async {
    // Show loading indicators.
    emit(LoginLoading());

    // Write credentials to memory/disk (so that the HTTP client can see them).
    await repository.storeCredentials(username, password);

    // Test that the credentials are valid and get a status code.
    var status = await repository.checkCredentials();

    if (status == "OK") {
      // The credentials successfully authenticated, how exciting!
      emit(LoginSuccess());
    } else {
      // Well that didn't work, time to clean up after ourselves.
      await repository.clearCredentials();

      // We present an appropriate error message if we know of one.
      if (status == "Unauthorized") {
        emit(LoginError(message: "The API key you entered is invalid."));
      } else if (status == "Timeout") {
        emit(LoginError(message: "Could not connect to server."));
      } else {
        emit(LoginError(message: "An unknown error occurred."));
      }
    }
  }
}
