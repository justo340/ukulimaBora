import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ukulimabora/Shared/Widgets/error_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Login/login_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Registration/registration_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Welcome/navigation.dart';
import 'package:ukulimabora/UserInterface/onboarding/Welcome/welcome_page.dart';
import 'package:ukulimabora/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final dynamic arg = settings.arguments;
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => BottomNavigation());
      case welcomeRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => WelcomePage());
      case loginRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
      case registrationRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => RegistrationPage());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute<dynamic>(builder: (_) {
    return ErrorPage();
  });
}
