import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UkulimaBoraCommonColors.appVeryBlackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: UkulimaBoraCommonColors.appGreenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              UkulimaBoraCommonText.taskText,
              style:
                  TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
            ),
          ],
        ),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[Container()],
        ),
      ),
    );
  }
}
