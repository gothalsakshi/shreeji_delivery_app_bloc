import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/otp_verification_screen.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final forgotPasswordFormKey = GlobalKey<FormState>();
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  

  void goToOtpVerificationScreen(BuildContext context){
    if(forgotPasswordFormKey.currentState!.validate()){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const OtpVerificationScreen()));
    }
  }
}
