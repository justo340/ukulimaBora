import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/routes/routes.dart';

class ZeroDisplay extends StatelessWidget {
  const ZeroDisplay(
      {@required this.noDataMessage,
      @required this.noDataTitle,
      @required this.image});

  final String noDataMessage;
  final String noDataTitle;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: image,
            ),
            Container(
              padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
              margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
              child: Text(
                noDataTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: UkulimaBoraCommonColors.appBackgroudColor
                        .withOpacity(0.5),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
              margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
              child: Text(
                noDataMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: UkulimaBoraCommonColors.appBackgroudColor
                        .withOpacity(0.3),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CommonAppButton(
              buttonAction: () => Navigator.of(context).pushNamed(homeRoute),
              buttonColor: UkulimaBoraCommonColors.appBlackColor,
              buttonText: UkulimaBoraCommonText.homeText,
              textColor: UkulimaBoraCommonColors.appBackgroudColor,
            ),
          ],
        ),
      ),
    );
  }
}
