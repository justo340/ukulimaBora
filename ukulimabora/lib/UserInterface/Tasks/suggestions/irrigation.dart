import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ukulimabora/Infrustracture/Services/Application_bloc.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_loading_indicator.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_text.dart';
import 'package:ukulimabora/Shared/Widgets/error_page.dart';
import 'package:ukulimabora/UserInterface/Tasks/suggestions/irrigation_suggestion_card.dart';

class IrrigationSuggestion extends StatefulWidget {
  @override
  _IrrigationSuggestionState createState() => _IrrigationSuggestionState();
}

class _IrrigationSuggestionState extends State<IrrigationSuggestion> {
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
            UkulimaBoraCommonText.irrigationText,
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

                                  final Map<String, dynamic> futureTemparature =
                                      futureWeather[index]['temp']
                                          as Map<String, dynamic>;

                                  final dynamic dayTemparature =
                                      futureTemparature['day'];

                                  final List<dynamic> weatherForcast =
                                      futureWeather[index]['weather']
                                          as List<dynamic>;

                                  final String bestWeather = weatherForcast[0]
                                          ['description']
                                      .toString();

                                  final dynamic irrigationTemparature =
                                      OptimalConditions
                                          .optimalIrrigationTemparatures
                                          .iterator;

                                  if (bestWeather != 'light_rain' ||
                                      dayTemparature == irrigationTemparature) {
                                    return IrrigationSuggestionCard(
                                      date: formatedDate,
                                      dayTemparature: dayTemparature,
                                      bestWeather: bestWeather,
                                    );
                                  }
                                  return Container();
                                }))),
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
      ),
    );
  }
}
