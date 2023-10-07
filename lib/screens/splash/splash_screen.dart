import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/login_screen.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
      Future.delayed(const Duration(seconds: 3),() {
        Navigator.of(context).pushReplacement(customPageRouteBuilder(const LoginScreen()));
        // context.pushReplacement(AppRoutes.loginScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/splash/splash.json', fit: BoxFit.fill,height: double.infinity,width: double.infinity)),
    );
  }
}