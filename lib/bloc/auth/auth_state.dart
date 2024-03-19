part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String uid;

  AuthSuccess({required this.uid});
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}

final class AuthLoading extends AuthState {}

final class GoogleLogin extends AuthState {
  final String uid;

  GoogleLogin({required this.uid});
}

final class EmailSignIn extends AuthState {
  final String uid;

  EmailSignIn({required this.uid});
}

final class FacebookLogin extends AuthState {
  final String name;

  FacebookLogin({required this.name});
}

final class SignOut extends AuthState {}
