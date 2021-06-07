import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Widgets/constants.dart';

class CommonAppBar extends StatefulWidget {
  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(child: Text(UkulimaBoraCommonText.appName)),
      backgroundColor: UkulimaBoraCommonColors.appGreenColor,
    );
  }
}
