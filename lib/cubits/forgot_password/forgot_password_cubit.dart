import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/otp_verification_screen.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final forgotPasswordFormKey = GlobalKey<FormState>();
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
  

  void goToOtpVerificationScreen(BuildContext context){
    if(forgotPasswordFormKey.currentState!.validate()){
      Navigator.of(context).push(customPageRouteBuilder(const OtpVerificationScreen()));
    }
  }

  @override
  Future<void> close() {
    // ignore: invalid_use_of_protected_member
    forgotPasswordFormKey.currentState!.dispose();
    return super.close();
  }
}
