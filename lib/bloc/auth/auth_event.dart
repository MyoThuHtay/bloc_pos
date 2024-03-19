part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class EmailLoginRequested extends AuthEvent {
  final String email;
  final String password;

  EmailLoginRequested({
    required this.email,
    required this.password,
  });
}

final class EmailSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String rePassword;

  EmailSignUpRequested( {
    required this.email,
    required this.password,
    required this.rePassword,
  });
}

final class GoogleLoginRequested extends AuthEvent {}

final class FacebookLoginRequested extends AuthEvent {}

final class SignOutRequest extends AuthEvent {}
