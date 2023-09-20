import 'package:flutter/material.dart';

import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/onboarding_button.dart';
import 'package:ukulimabora/routes/routes.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            UkulimaBoraCommonColors.appLightGreenColor,
            // Colors.blueGrey.shade600,
            UkulimaBoraCommonColors.appVeryBlackColor
          ],),),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Container(
                margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                        top: 230,
                        right: 70,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    UkulimaBoraCommonColors
                                        .appGreenColor.shade500,
                                    UkulimaBoraCommonColors.appBackgroudColor,
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,),),
                        ),),
                    Positioned(
                        top: 180,
                        right: 50,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    UkulimaBoraCommonColors
                                        .appGreenColor.shade500,
                                    UkulimaBoraCommonColors.appBackgroudColor,
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,),),
                        ),),
                    Positioned(
                        top: 170,
                        right: 150,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    UkulimaBoraCommonColors
                                        .appGreenColor.shade400,
                                    UkulimaBoraCommonColors.appBackgroudColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,),
                              borderRadius: BorderRadius.circular(50),),
                        ),),
                    Positioned(
                        top: 220,
                        right: 100,
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset('assets/images/growth.png'),
                        ),),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: UkulimaBoraCustomSpaces.bottomMarginSpacing,
                  child: Text(
                    UkulimaBoraCommonText.welcomeText,
                    style: TextStyle(
                        color: UkulimaBoraCommonColors.appBlackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,),
                  ),
                ),
              ),
              OnboardingButton(
                buttonAction: () {
                  Navigator.of(context).pushNamed(registrationRoute);
                },
                buttonText: UkulimaBoraCommonText.registerText,
              ),
              OnboardingButton(
                buttonAction: () {
                  Navigator.of(context).pushNamed(loginRoute);
                },
                buttonText: UkulimaBoraCommonText.loginText,
              )
            ],
          ),),
    );
  }
}
