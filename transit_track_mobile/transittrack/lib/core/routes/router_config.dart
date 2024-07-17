import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transittrack/core/routes/route_path.dart';
import 'package:transittrack/features/authentication/presentation/pages/forget_password_page.dart';
import 'package:transittrack/features/authentication/presentation/pages/login_page.dart';
import 'package:transittrack/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:transittrack/features/authentication/presentation/pages/signup_page.dart';
import 'package:transittrack/features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: AppPath.login, routes: <GoRoute>[
    GoRoute(
        path: AppPath.onboarding,
        name: AppPath.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return OnboardingPage();
        }),
     GoRoute(
        path: AppPath.login,
        name: AppPath.login,
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        }),
       GoRoute(
        path: AppPath.signup,
        name: AppPath.signup,
        builder: (BuildContext context, GoRouterState state) {
          return SignupPage();
        }),
         GoRoute(
        path: AppPath.otpVerification,
        name: AppPath.otpVerification,
        builder: (BuildContext context, GoRouterState state) {
          return OtpVerificationPage();
        }),
         GoRoute(
        path: AppPath.forgetPassword,
        name: AppPath.forgetPassword,
        builder: (BuildContext context, GoRouterState state) {
          return ForgetPasswordPage();
        })
  ]);
}
