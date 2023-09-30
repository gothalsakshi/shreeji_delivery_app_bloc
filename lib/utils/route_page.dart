import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/forgot_password_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/login_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/otp_verification_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/authentication/reset_password_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/assigned_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/completed_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/empty_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/issue_details_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/order_details_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/payment_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/profile/profile_screen.dart';
import 'package:shreeji_delivery_app_bloc/screens/splash/splash_screen.dart';
import 'package:shreeji_delivery_app_bloc/utils/routes.dart';

class AppPages {
  GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.splashScreen,
    routes: <RouteBase>[
      GoRoute(
        // name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        }),
      GoRoute(
        // name: AppRoutes.splashScreen,
        path: AppRoutes.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
      GoRoute(
        // name: AppRoutes.forgotPasswordScreen,
        path: AppRoutes.forgotPasswordScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgotPasswordScreen();
        }),
      GoRoute(
        // name: AppRoutes.otpVerificationScreen,
        path: AppRoutes.otpVerificationScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OtpVerificationScreen();
        }),
      GoRoute(
        // name: AppRoutes.resetPasswordScreen,
        path: AppRoutes.resetPasswordScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ResetPasswordScreen();
        }),
      GoRoute(
        // name: AppRoutes.assignedOrderScreen,
        path: AppRoutes.assignedOrderScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AssignedOrderScreen();
        }),
      GoRoute(
        // name: AppRoutes.completedOrderScreen,
        path: AppRoutes.completedOrderScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const CompletedOrderScreen();
        }),
      GoRoute(
        // name: AppRoutes.emptyOrderScreen,
        path: AppRoutes.emptyOrderScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const EmptyOrderScreen();
        }),
      GoRoute(
        // name: AppRoutes.issueDetailsScreen,
        path: AppRoutes.issueDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const IssueDetailsScreen();
        }),
      GoRoute(
        // name: AppRoutes.orderDetailsScreen,
        path: AppRoutes.orderDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OrderDetailsScreen();
        }),
      GoRoute(
        // name: AppRoutes.paymentScreen,
        path: AppRoutes.paymentScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const PaymentScreen();
        }),
      GoRoute(
        // name: AppRoutes.profileScreen,
        path: AppRoutes.profileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        }),
    ],
  );
  // List appPages = [
  //   GoRoute(
  //       path: AppRoutes.splashScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const SplashScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.loginScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const LoginScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.forgotPasswordScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ForgotPasswordScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.otpVerificationScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const OtpVerificationScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.resetPasswordScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ResetPasswordScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.assignedOrderScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const AssignedOrderScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.completedOrderScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const CompletedOrderScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.emptyOrderScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const EmptyOrderScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.issueDetailsScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const IssueDetailsScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.orderDetailsScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const OrderDetailsScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.paymentScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const PaymentScreen();
  //   }),
  //   GoRoute(
  //       path: AppRoutes.profileScreen,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ProfileScreen();
  //   }),
  // ];
}
