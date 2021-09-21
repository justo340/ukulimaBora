import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_text.dart';
import 'package:ukulimabora/Shared/Widgets/common_weather_update_card.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UkulimaBoraCommonColors.appVeryBlackColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme:
            IconThemeData(color: UkulimaBoraCommonColors.appBackgroudColor),
        backgroundColor: UkulimaBoraCommonColors.appGreenColor,
        title: Container(
          padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
          child: Text(
            UkulimaBoraCommonText.weatherText,
            style: TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
          ),
        ),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            const CurrentWeatherInfoCard(),
            DailyForecastText(),
            WeatherCard(),
          ],
        ),
      ),
    );
  }
}

class CurrentWeatherInfoCard extends StatelessWidget {
  const CurrentWeatherInfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
              child: Text('location',
                  style: TextStyle(
                      fontSize: 25,
                      color: UkulimaBoraCommonColors.appBackgroudColor)),
            ),
            Container(
              padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
              child: Text('weather',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: UkulimaBoraCommonColors.appBackgroudColor)),
            )
          ],
        ));
  }
}
