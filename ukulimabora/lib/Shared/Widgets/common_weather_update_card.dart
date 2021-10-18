import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {@required this.weatherForcast,
      @required this.date,
      @required this.windSpeed,
      @required this.maxTemparatures,
      @required this.minTemparatures});

  final List<dynamic> weatherForcast;
  final double maxTemparatures;
  final double minTemparatures;
  final String date;
  final double windSpeed;

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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Max temp : $maxTemparatures °C',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                  Text('Min temp : $minTemparatures °C',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                ],
              ),
              UkulimaBoraDivider.normaldivider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(weatherForcast[0]['description'].toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appVeryBlackColor)),
                  Text('Wind speed :$windSpeed m/s',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$date',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: UkulimaBoraCommonColors.appBackgroudColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
