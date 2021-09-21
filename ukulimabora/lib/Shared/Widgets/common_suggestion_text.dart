import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class SuggestedDayText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.lightbulb_outline_rounded,
            size: 20,
            color: UkulimaBoraCommonColors.appBackgroudColor.withOpacity(0.3),
          ),
          const SizedBox(width: 10),
          Text(
            UkulimaBoraCommonText.suggestionText,
            style: TextStyle(
                fontSize: 16,
                color:
                    UkulimaBoraCommonColors.appBackgroudColor.withOpacity(0.3)),
          )
        ],
      ),
    );
  }
}

class DailyForecastText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.lightbulb_outline_rounded,
            size: 20,
            color: UkulimaBoraCommonColors.appBackgroudColor.withOpacity(0.3),
          ),
          const SizedBox(width: 10),
          Text(
            UkulimaBoraCommonText.dailyForecastText,
            style: TextStyle(
                fontSize: 16,
                color:
                    UkulimaBoraCommonColors.appBackgroudColor.withOpacity(0.3)),
          )
        ],
      ),
    );
  }
}
