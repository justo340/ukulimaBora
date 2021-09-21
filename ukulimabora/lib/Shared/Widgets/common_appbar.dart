import 'package:flutter/material.dart';

import 'package:ukulimabora/Shared/Common/constants.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    @required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme:
          IconThemeData(color: UkulimaBoraCommonColors.appBackgroudColor),
      title: SizedBox(
          child: Text(
        label,
        style: TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
      )),
      backgroundColor: UkulimaBoraCommonColors.appGreenColor,
    );
  }
}
