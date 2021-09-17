import 'package:flutter/material.dart';

import 'package:ukulimabora/Shared/Common/constants.dart';

// class CommonAppBar extends StatefulWidget {
//   CommonAppBar(@required this.label);

//   String label;
//   @override
//   _CommonAppBarState createState() => _CommonAppBarState();
// }

// class _CommonAppBarState extends State<CommonAppBar> {
//   @override
//   Widget build(BuildContext context) {

//         return
//   }
// }

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    @required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
