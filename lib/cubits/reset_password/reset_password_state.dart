part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ShowNewPassword extends ResetPasswordState{
  final bool showNewPassword;

  ShowNewPassword({required this.showNewPassword});
}

class HideNewPassword extends ResetPasswordState{
  final bool hideNewPassword;

  HideNewPassword({required this.hideNewPassword});
}

class ShowConfirmPassword extends ResetPasswordState{
  final bool showConfirmPassword;

  ShowConfirmPassword({required this.showConfirmPassword});
}

class HideConfirmPassword extends ResetPasswordState{
  final bool hideConfirmPassword;

  HideConfirmPassword({required this.hideConfirmPassword});
}
