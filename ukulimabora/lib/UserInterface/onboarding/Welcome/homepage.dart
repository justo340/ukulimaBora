import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CommonAppBar(),
          Padding(
            padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
            child: Card(
              color: UkulimaBoraCommonColors.appGreenColor,
              elevation: 2,
              shadowColor: UkulimaBoraCommonColors.appBlackColor,
              child: Container(
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
