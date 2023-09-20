import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class IrrigationSuggestionCard extends StatelessWidget {
  const IrrigationSuggestionCard({
    required this.date,
    required this.dayTemparature,
    required this.bestWeather,
  });
  final String date;
  final dynamic dayTemparature;
  final String bestWeather;

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
                          color: UkulimaBoraCommonColors.appBackgroudColor,),),
                  UkulimaBoraDivider.normaldivider,
                  Text(bestWeather,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appVeryBlackColor,),)
                ],
              ),
              Text('Average Temp :$dayTemparature °C',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: UkulimaBoraCommonColors.appBackgroudColor,),),
            ],
          ),
        ),
      ),
    );
  }
}
