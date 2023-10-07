
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/assigned_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
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
      Navigator.of(context).pushReplacement(customPageRouteBuilder(const AssignedOrderScreen()));
      // context.pushReplacementNamed(AppRoutes.assignedOrderScreen);
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
