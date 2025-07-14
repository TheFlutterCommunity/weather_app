part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  AuthInitialState();
}

class AuthLoadingState extends AuthState {
  AuthLoadingState();
}

class SignInErrorState extends AuthState {
  final String error;

  SignInErrorState({required this.error});
}

class SignInSuccessState extends AuthState {
  SignInSuccessState();
}

class SignInStatusState extends AuthState {
  final bool isSignedIn;
  final String userName;

  SignInStatusState({required this.isSignedIn, required this.userName});
}
