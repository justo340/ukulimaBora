import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UkulimaBoraCommonColors.appVeryBlackColor,
      body: Column(
        children: <Widget>[
          CustomTaskAppBar(),
          const SizedBox(height: 20),
          // TaskConatiner()
        ],
      ),
    );
  }
}

class CustomTaskAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(50)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                UkulimaBoraCommonColors.appGreenColor,
                UkulimaBoraCommonColors.appVeryBlackColor
              ]),
        ),
        padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CircularPercentIndicator(
              radius: 130,
              progressColor: UkulimaBoraCommonColors.appVeryBlackColor,
              backgroundColor: UkulimaBoraCommonColors.appBackgroudColor,
              lineWidth: 15,
              percent: 0.5,
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '50 % \nDone',
                style: TextStyle(
                    color: UkulimaBoraCommonColors.appBackgroudColor,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  UkulimaBoraCommonText.taskText,
                  style: TextStyle(
                      color: UkulimaBoraCommonColors.appBackgroudColor,
                      fontSize: 25),
                ),
              ],
            ),
          ],
        ));
  }
}

class TaskConatiner extends StatefulWidget {
  @override
  _TaskConatinerState createState() => _TaskConatinerState();
}

class _TaskConatinerState extends State<TaskConatiner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
      child: Card(
        color: Colors.transparent,
        elevation: 2,
        child: Container(
          padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('data',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: UkulimaBoraCommonColors.appBackgroudColor)),
              UkulimaBoraDivider.normaldivider,
              const Text('data',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
