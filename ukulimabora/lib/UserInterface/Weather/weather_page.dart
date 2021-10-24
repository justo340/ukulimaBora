import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:ukulimabora/Infrustracture/Services/Application_bloc.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_loading_indicator.dart';
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
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
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
                              DateFormat('EEEE MMM-dd').format(date);

                          final List<dynamic> weatherForcast =
                              futureWeather[index]['weather'] as List<dynamic>;

                          final Map<String, dynamic> futureTemparature =
                              futureWeather[index]['temp']
                                  as Map<String, dynamic>;

                          final dynamic maxTemparatures =
                              futureTemparature['max'];

                          final dynamic minTemparatures =
                              futureTemparature['min'];

                          final dynamic windSpeed =
                              futureWeather[index]['wind_speed'];

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
              );
            } else if (snapshot.hasError) {
              return ErrorPage(
                image: Image.asset('assets/images/error.png'),
                errorTitle: UkulimaBoraCommonText.genericErrorTitle,
                errorMessage: UkulimaBoraCommonText.genericErrorMessage,
              );
            }
            return UkulimaBoraLoadingIndicator();
          }),
    );
  }
}

// ignore: must_be_immutable
class CurrentWeatherInfoCard extends StatefulWidget {
  CurrentWeatherInfoCard({
    @required this.weather,
    @required this.temparature,
    @required this.longitude,
    @required this.latitude,
  });

  final List<dynamic> weather;
  final double temparature;
  final double latitude;
  final double longitude;
  String location = '';

  @override
  _CurrentWeatherInfoCardState createState() => _CurrentWeatherInfoCardState();
}

class _CurrentWeatherInfoCardState extends State<CurrentWeatherInfoCard> {
  @override
  Widget build(BuildContext context) {
    _getAddressFromLatLng().then((String value) {
      setState(() {
        widget.location = value;
      });
    });

    return FutureBuilder<dynamic>(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return Container(
          padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                child: Text(widget.location,
                    style: TextStyle(
                        fontSize: 25,
                        color: UkulimaBoraCommonColors.appBackgroudColor)),
              ),
              Container(
                  padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  child: Text('${widget.temparature} °C',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appBackgroudColor))),
              Container(
                  padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                  child: Text(widget.weather[0]['description'].toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: UkulimaBoraCommonColors.appBackgroudColor)))
            ],
          ));
    });
  }

  Future<String> _getAddressFromLatLng() async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(widget.latitude, widget.longitude);

      final Placemark place = placemarks[0];

      final String location =
          '${place.locality}, ${place.subLocality}, ${place.country} ';

      return location;
    } catch (e) {
      return e.message.toString();
    }
  }
}
