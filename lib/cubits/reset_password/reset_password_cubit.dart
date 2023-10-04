import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/login_screen.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  GlobalKey<FormState> resetPassewordformKey = GlobalKey<FormState>();
  bool showNewPassword = false;
  bool showConfirmPassword = false;

  void checkValidation(BuildContext context){
    if(resetPassewordformKey.currentState!.validate()){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const LoginScreen()));
    }
  }

  void checkVisibilityForNewPassword(){
    showNewPassword = ! showNewPassword;
    if(showNewPassword== true){
      emit(ShowNewPassword(showNewPassword: showNewPassword));
    }else{
      emit(HideNewPassword(hideNewPassword: showNewPassword));
    }
  }

  void checkVisibilityForConfirmPassword(){
    showConfirmPassword = ! showConfirmPassword;
    if(showConfirmPassword == true){
      emit(ShowConfirmPassword(showConfirmPassword: showConfirmPassword));
    }else{
      emit(HideConfirmPassword(hideConfirmPassword: showConfirmPassword));
    }
  }
}
