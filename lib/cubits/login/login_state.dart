part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class PasswordVisibilityOnState extends LoginState{
  final bool showPassword;

  PasswordVisibilityOnState({required this.showPassword});
}

class PasswordVisibilityOffState extends LoginState{
  final bool hidePassword;

  PasswordVisibilityOffState({required this.hidePassword});
}