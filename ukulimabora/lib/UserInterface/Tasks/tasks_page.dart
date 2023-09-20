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
          TaskConatiner()
        ],
      ),
    );
  }
}

class CustomTaskAppBar extends StatelessWidget {
  // double percentage = complete;
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
              ],),
        ),
        padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
        child: Column(
          children: <Widget>[
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
                    fontSize: 20,),
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
                      fontSize: 25,),
                ),
              ],
            ),
          ],
        ),);
  }
}

class TaskConatiner extends StatefulWidget {
  @override
  _TaskConatinerState createState() => _TaskConatinerState();
}

class _TaskConatinerState extends State<TaskConatiner> {
  bool isSelected = false;

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
              TaskRow(
                isSelected: isSelected,
                activity: UkulimaBoraActivities.land,
              ),
              TaskRow(
                isSelected: isSelected,
                activity: UkulimaBoraActivities.plant,
              ),
              TaskRow(
                isSelected: isSelected,
                activity: UkulimaBoraActivities.irrigate,
              ),
              TaskRow(
                isSelected: isSelected,
                activity: UkulimaBoraActivities.fertilizer,
              ),
              TaskRow(
                isSelected: isSelected,
                activity: UkulimaBoraActivities.pesticide,
              ),
              TaskRow(
                isSelected: isSelected,
                activity: UkulimaBoraActivities.havest,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskRow extends StatefulWidget {
  TaskRow({
    required this.isSelected,
    required this.activity,
  });
 late bool isSelected;
  late String activity;
  late int percentage;
  // double interval = 16.67;
  // int complete;

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
            checkColor: UkulimaBoraCommonColors.appGreenColor,
            value: widget.isSelected,
            onChanged: (bool? newValue) {
              setState(() {
                widget.isSelected = newValue!;

                // stderr.writeln(widget.percentage);
              });
            },
            activeColor: UkulimaBoraCommonColors.appGreenColor,
            fillColor: MaterialStateProperty.all(
                UkulimaBoraCommonColors.appBackgroudColor,),),
        const SizedBox(
          width: 20,
        ),
        Text(widget.activity,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: UkulimaBoraCommonColors.appBackgroudColor,),),
      ],
    );
  }
}
