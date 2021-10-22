import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class FertilizerSuggestionCard extends StatelessWidget {
  const FertilizerSuggestionCard({
    @required this.bestWeather,
    @required this.windSpeed,
    @required this.date,
  });
  final String bestWeather;
  final dynamic windSpeed;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
      child: Card(
        color: UkulimaBoraCommonColors.appGreenColor,
        elevation: 2,
        child: Container(
          padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(date,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                  UkulimaBoraDivider.normaldivider,
                  Text(bestWeather,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appVeryBlackColor))
                ],
              ),
              Text('wind Speed : $windSpeed m/s',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: UkulimaBoraCommonColors.appBackgroudColor)),
            ],
          ),
        ),
      ),
    );
  }
}
