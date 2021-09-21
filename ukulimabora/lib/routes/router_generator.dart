import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ukulimabora/Shared/Widgets/error_page.dart';
import 'package:ukulimabora/UserInterface/Location/Farm/add_farm_page.dart';
import 'package:ukulimabora/UserInterface/Location/Map/map_page.dart';
import 'package:ukulimabora/UserInterface/Profile/profile_page.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/fertilizer.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/harvest.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/irrigation.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/land_prep.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/pesticide.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/planting.dart';
import 'package:ukulimabora/UserInterface/Weather/weather_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Login/login_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Registration/registration_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Welcome/bottom_navigation.dart';
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
      case profileRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => ProfilePage());
      case addFarmRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => AddFarmPage());
      case locationRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => MapPage());
      case landPrepRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => LandPrepSuggestion());
      case plantingRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => PlantingSuggestion());
      case fertilizerRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => FertilizerSuggestion());
      case irrigationRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => IrrigationSuggestion());
      case pesticideRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => PesticideSuggestion());
      case harvestRoute:
        return MaterialPageRoute<dynamic>(
            builder: (_) => HarvestingSuggestion());
      case weatherRoute:
        return MaterialPageRoute<dynamic>(builder: (_) => WeatherPage());
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
