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
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: SplashScreen());
        }),
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.loginScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: LoginScreen());
        }),
      GoRoute(
        name: AppRoutes.forgotPasswordScreen,
        path: AppRoutes.forgotPasswordScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: ForgotPasswordScreen());
        }),
      GoRoute(
        name: AppRoutes.otpVerificationScreen,
        path: AppRoutes.otpVerificationScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: OtpVerificationScreen());
        }),
      GoRoute(
        name: AppRoutes.resetPasswordScreen,
        path: AppRoutes.resetPasswordScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: ResetPasswordScreen());
        }),
      GoRoute(
        name: AppRoutes.assignedOrderScreen,
        path: AppRoutes.assignedOrderScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: AssignedOrderScreen());
        }),
      GoRoute(
        name: AppRoutes.completedOrderScreen,
        path: AppRoutes.completedOrderScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: CompletedOrderScreen());
        }),
      GoRoute(
        name: AppRoutes.emptyOrderScreen,
        path: AppRoutes.emptyOrderScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: EmptyOrderScreen());
        }),
      GoRoute(
        name: AppRoutes.issueDetailsScreen,
        path: AppRoutes.issueDetailsScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: IssueDetailsScreen());
        }),
      GoRoute(
        name: AppRoutes.orderDetailsScreen,
        path: AppRoutes.orderDetailsScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: OrderDetailsScreen());
        }),
      GoRoute(
        name: AppRoutes.paymentScreen,
        path: AppRoutes.paymentScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: PaymentScreen());
        }),
      GoRoute(
        name: AppRoutes.profileScreen,
        path: AppRoutes.profileScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: ProfileScreen());
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
