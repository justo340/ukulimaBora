import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class PlantingSuggestionCard extends StatelessWidget {
  const PlantingSuggestionCard(
      {@required this.bestWeather,
      @required this.dayTemparature,
      @required this.date});

  final String bestWeather;
  final dynamic dayTemparature;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Average temp : $dayTemparature °C',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                  Text(date,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                ],
              ),
              UkulimaBoraDivider.normaldivider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(bestWeather,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appVeryBlackColor)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
