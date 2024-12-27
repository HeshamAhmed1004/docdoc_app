import 'package:docdoc_app/core/di/dependency_injection.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/features/home/ui/home_screen.dart';
import 'package:docdoc_app/features/login/logic/login_cubit.dart';
import 'package:docdoc_app/features/login/ui/login_screen.dart';
import 'package:docdoc_app/features/onboarding/onboarding_screen.dart';
import 'package:docdoc_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:docdoc_app/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ); case Routes.homeScreen:
        return MaterialPageRoute(

          builder: (context) => const HomeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: ( context) => getIt<LoginCubit>(),
              child: const LoginScreen()),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: ( context) => getIt<SignupCubit>(),
              child: const SignupScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No page defined'),
            ),
          ),
        );
    }
  }
}
