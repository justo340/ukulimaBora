import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/UserInterface/Notification/notifications.dart';
import 'package:ukulimabora/UserInterface/Tasks/tasks_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Welcome/homepage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    HomePage(),
    NotificationsPage(),
    TasksPage(),
  ];

  void bottomNavigatorFunction(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme:
            IconThemeData(color: UkulimaBoraCommonColors.appVeryBlackColor),
        backgroundColor: UkulimaBoraCommonColors.appGreenColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: UkulimaBoraCommonText.homeText,),
          BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: UkulimaBoraCommonText.notificationText,),
          BottomNavigationBarItem(
              icon: const Icon(Icons.assignment),
              label: UkulimaBoraCommonText.taskText,)
        ],
        currentIndex: selectedIndex,
        onTap: bottomNavigatorFunction,
      ),
    );
  }
}
