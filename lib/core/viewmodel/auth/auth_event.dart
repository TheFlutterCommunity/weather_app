part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {
  AuthInitialEvent();
}

class CheckSignedInEvent extends AuthEvent {
  CheckSignedInEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}
