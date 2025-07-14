import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<CheckSignedInEvent>((event, emit) => _checkIsSignedIn(event, emit));
    on<SignInEvent>((event, emit) => _onSignIn(event, emit));
  }

  Future<void> _checkIsSignedIn(
    CheckSignedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    /// Emit the loading state
    emit(AuthLoadingState());

    /// Fetch the user session
    bool isSignedIn = await locator<PrefsHelper>().isSignedIn();
    String userName = await locator<PrefsHelper>().getUserName();

    /// Emit the Status state
    emit(SignInStatusState(isSignedIn: isSignedIn, userName: userName));
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      /// Emit the loading state
      emit(AuthLoadingState());

      /// Call the repository for login
      final response = await locator<AuthRepository>().signIn(
        userName: event.email,
        password: event.password,
      );

      /// Create user session
      locator<PrefsHelper>().createUserSession(user: response.userDetails!);

      /// Emit the success state
      emit(SignInSuccessState());
    } catch (e) {
      if (e is AuthException) {
        /// Emit the error state
        emit(SignInErrorState(error: e.message));
      } else if (e is Exception) {
        /// Emit the error state
        emit(SignInErrorState(error: kError));
      }
    }
  }
}
