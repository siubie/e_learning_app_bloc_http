part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

//add state for login success
final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccess(this.loginResponse);
}

//add state for login failed
final class LoginFailed extends LoginState {
  final String message;
  LoginFailed(this.message);
}

//add state for login in progress
final class LoginInProgress extends LoginState {}
