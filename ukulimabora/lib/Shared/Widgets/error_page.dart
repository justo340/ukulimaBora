import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/Shared/Widgets/common_appbar.dart';

class ErrorPage extends StatelessWidget {
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
              Colors.green.shade400,
              Colors.blueGrey.shade600,
              Colors.blueGrey.shade900
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                CommonAppBar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            child: Image.asset(
                          'assets/images/error.png',
                          height: 150,
                          width: 150,
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                          margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
                          child: Text(
                            UkulimaBoraCommonText.genericErrorMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color:
                                    UkulimaBoraCommonColors.appBackgroudColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonAppButton(
                          buttonAction: Navigator.of(context).pop,
                          buttonColor: UkulimaBoraCommonColors.appGreenColor,
                          buttonText: UkulimaBoraCommonText.retryMessage,
                          textColor: UkulimaBoraCommonColors.appBackgroudColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
