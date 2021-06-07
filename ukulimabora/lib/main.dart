import 'package:flutter/material.dart';

import 'Shared/Widgets/constants.dart';
import 'UserInterface/onboarding/Welcome/welcome_page.dart';

void main() {
  runApp(UkulimaBora());
}

class UkulimaBora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UkulimaBora',
        theme: ThemeData(
            primaryColor: UkulimaBoraCommonColors.appBackgroudColor,
            scaffoldBackgroundColor: UkulimaBoraCommonColors.appWhiteColor),
        home: WelcomePage());
  }
}
