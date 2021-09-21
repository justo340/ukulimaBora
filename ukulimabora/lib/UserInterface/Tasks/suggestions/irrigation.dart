import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_card.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_text.dart';

class IrrigationSuggestion extends StatefulWidget {
  @override
  _IrrigationSuggestionState createState() => _IrrigationSuggestionState();
}

class _IrrigationSuggestionState extends State<IrrigationSuggestion> {
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
        child: ListView(
          children: <Widget>[
            SuggestedDayText(),
            SuggestionCard(),
          ],
        ),
      ),
    );
  }
}
