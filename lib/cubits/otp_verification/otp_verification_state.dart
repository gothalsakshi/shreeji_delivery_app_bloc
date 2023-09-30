part of 'otp_verification_cubit.dart';

@immutable
abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}

class CountDownStartState extends OtpVerificationState{
  final int countDownTimer;

  CountDownStartState({required this.countDownTimer});
}

class ResetCountDownState extends OtpVerificationState{
  final int countDownTimer;

  ResetCountDownState({required this.countDownTimer});
}