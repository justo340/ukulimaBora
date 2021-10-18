import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:ukulimabora/Infrustracture/Services/Application_bloc.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_text.dart';
import 'package:ukulimabora/Shared/Widgets/common_weather_update_card.dart';
import 'package:ukulimabora/Shared/Widgets/error_page.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final ApplicationBloc applicationBloc = ApplicationBloc();
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
      body: FutureBuilder<dynamic>(
          future: applicationBloc.getWeather(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final double latitude = snapshot.data['lat'] as double;

              final double longitude = snapshot.data['lon'] as double;

              final List<dynamic> weather =
                  snapshot.data['current']['weather'] as List<dynamic>;

              final double currentTemparature =
                  snapshot.data['current']['temp'] as double;

              final List<dynamic> futureWeather =
                  snapshot.data['daily'] as List<dynamic>;
              return SizedBox(
                child: Column(
                  children: <Widget>[
                    CurrentWeatherInfoCard(
                      longitude: longitude,
                      latitude: latitude,
                      temparature: currentTemparature,
                      weather: weather,
                    ),
                    DailyForecastText(),
                    SizedBox(
                      height: 380,
                      child: Scrollbar(
                        showTrackOnHover: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: futureWeather.length,
                          itemBuilder: (BuildContext context, int index) {
                            final int timeStamp =
                                futureWeather[index]['dt'] as int;

                            final DateTime date =
                                DateTime.fromMillisecondsSinceEpoch(
                                    timeStamp * 1000);

                            final String formatedDate =
                                DateFormat('MMM-dd-yyyy').format(date);

                            final List<dynamic> weatherForcast =
                                futureWeather[index]['weather']
                                    as List<dynamic>;

                            final Map<String, dynamic> futureTemparature =
                                futureWeather[index]['temp']
                                    as Map<String, dynamic>;

                            final double maxTemparatures =
                                futureTemparature['max'] as double;

                            final double minTemparatures =
                                futureTemparature['min'] as double;

                            final double windSpeed =
                                futureWeather[index]['wind_speed'] as double;

                            return WeatherCard(
                                date: formatedDate,
                                windSpeed: windSpeed,
                                weatherForcast: weatherForcast,
                                maxTemparatures: maxTemparatures,
                                minTemparatures: minTemparatures);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return ErrorPage();
          }),
    );
  }
}

class CurrentWeatherInfoCard extends StatelessWidget {
  const CurrentWeatherInfoCard(
      {@required this.weather,
      @required this.temparature,
      @required this.longitude,
      @required this.latitude});

  final List<dynamic> weather;
  final double temparature;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    _getAddressFromLatLng();
    return FutureBuilder<dynamic>(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return Container(
          padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                child: Text('',
                    style: TextStyle(
                        fontSize: 25,
                        color: UkulimaBoraCommonColors.appBackgroudColor)),
              ),
              Container(
                  padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  child: Text('$temparature °C',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appBackgroudColor))),
              Container(
                  padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  child: Text(weather[0]['description'].toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appBackgroudColor)))
            ],
          ));
    });
  }

  dynamic _getAddressFromLatLng() async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      final Placemark place = placemarks[0];

      final dynamic location =
          '${place.locality}, ${place.postalCode}, ${place.country}';
      print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
      print(location);

      return location;
    } catch (e) {
      return e.message.toString();
    }
  }
}
