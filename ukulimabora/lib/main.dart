import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ukulimabora/routes/router_generator.dart';
import 'package:ukulimabora/routes/routes.dart';

import 'Shared/Common/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          <DeviceOrientation>[DeviceOrientation.portraitUp])
      .then((_) => runApp(UkulimaBora()));
}

class UkulimaBora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: welcomeRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'UkulimaBora',
      theme: ThemeData(
          primaryColor: UkulimaBoraCommonColors.appBackgroudColor,
          scaffoldBackgroundColor: UkulimaBoraCommonColors.appWhiteColor),
    );
  }
}
