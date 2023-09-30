import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shreeji_delivery_app_bloc/utils/routes.dart';
// import 'package:shreeji_delivery_app_bloc/utils/validation_mixin.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()){
    // checkPasswordVisbibility();
  }

  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void goToAssignedOrderScreen(BuildContext context){
    if(formKey.currentState!.validate()){
      context.pushReplacementNamed(AppRoutes.assignedOrderScreen);
      debugPrint('here is mobile number --->${phonenoController.text} and here is password ---->${passwordController.text}');
    } 
  }

  void checkPasswordVisbibility(){
    showPassword = ! showPassword;
    if(showPassword == true){
      debugPrint('here is password show--->$showPassword');
      emit(PasswordVisibilityOnState(showPassword: showPassword));
    }else{
      debugPrint('here is password show--->$showPassword');
      emit(PasswordVisibilityOffState(hidePassword: showPassword));
    }
  }
}
