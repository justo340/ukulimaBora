import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class CommonAppBar extends StatefulWidget {
  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(child: Text(UkulimaBoraCommonText.appName)),
      backgroundColor: UkulimaBoraCommonColors.appGreenColor,
    );
  }
}
