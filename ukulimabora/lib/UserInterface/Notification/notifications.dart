import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/zero_display.dart';

class NotificationsPage extends StatelessWidget {
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
              UkulimaBoraCommonText.notificationText,
              style:
                  TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
            ),
          ],
        ),
      ),
      body: ZeroDisplay(
        image: Image.asset(
          'assets/images/zeronotification.png',
          color: UkulimaBoraCommonColors.appGreenColor,
          height: 80,
          width: 80,
        ),
        noDataTitle: UkulimaBoraCommonText.noNotificationTitle,
        noDataMessage: UkulimaBoraCommonText.noNotificationMessage,
      ),
    );
  }
}

class NotificationsCard extends StatefulWidget {
  @override
  _NotificationsCardState createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
      child: Card(
        color: UkulimaBoraCommonColors.appGreenColor,
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
                      color: UkulimaBoraCommonColors.appBackgroudColor,),),
              UkulimaBoraDivider.normaldivider,
              const Text('data',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
