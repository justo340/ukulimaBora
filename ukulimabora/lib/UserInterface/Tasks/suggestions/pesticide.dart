import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ukulimabora/Infrustracture/Services/Application_bloc.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_loading_indicator.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_text.dart';
import 'package:ukulimabora/Shared/Widgets/error_page.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/pesticide_suggestion_card.dart';

class PesticideSuggestion extends StatefulWidget {
  @override
  _PesticideSuggestionState createState() => _PesticideSuggestionState();
}

class _PesticideSuggestionState extends State<PesticideSuggestion> {
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
            UkulimaBoraCommonText.pesticideText,
            style: TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
          ),
        ),
      ),
      body: Scrollbar(
        child: FutureBuilder<dynamic>(
            future: applicationBloc.getWeather(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final List<dynamic> futureWeather =
                    snapshot.data['daily'] as List<dynamic>;

                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    SuggestedDayText(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
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
                                  futureWeather[index]['weather']
                                      as List<dynamic>;

                              final dynamic windSpeed =
                                  futureWeather[index]['wind_speed'];

                              final String bestWeather =
                                  weatherForcast[0]['description'].toString();

                              final dynamic optimalWindSpeed =
                                  OptimalConditions.optimalWind.iterator;

                              if (bestWeather != 'heavy rain' ||
                                  windSpeed.toStringAsFixed(0) ==
                                      optimalWindSpeed) {
                                return PesticideSuggestionCard(
                                    date: formatedDate,
                                    windSpeed: windSpeed,
                                    bestWeather: bestWeather);
                              }
                              return Container();
                            }),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return ErrorPage();
              }
              return UkulimaBoraLoadingIndicator();
            }),
      ),
    );
  }
}
