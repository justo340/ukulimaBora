import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(
      {@required this.errorMessage,
      @required this.errorTitle,
      @required this.image});

  final String errorMessage;
  final String errorTitle;
  final Image image;

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
              UkulimaBoraCommonColors.appVeryBlackColor
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child: image,
                ),
                Container(
                  padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  child: Text(
                    errorTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: UkulimaBoraCommonColors.appVeryBlackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: UkulimaBoraCommonColors.appVeryBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                CommonAppButton(
                  buttonAction: () => Navigator.of(context).pop,
                  buttonColor: UkulimaBoraCommonColors.appVeryBlackColor,
                  buttonText: UkulimaBoraCommonText.retryMessage,
                  textColor: UkulimaBoraCommonColors.appBackgroudColor,
                ),
              ],
            ),
          ),
        ));
  }
}
