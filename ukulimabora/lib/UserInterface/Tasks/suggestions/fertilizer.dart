import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_card.dart';
import 'package:ukulimabora/Shared/Widgets/common_suggestion_text.dart';

class FertilizerSuggestion extends StatefulWidget {
  @override
  _FertilizerSuggestionState createState() => _FertilizerSuggestionState();
}

class _FertilizerSuggestionState extends State<FertilizerSuggestion> {
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
            UkulimaBoraCommonText.fertilizerText,
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
