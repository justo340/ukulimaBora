import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class UkulimaBoraLoadingIndicator extends StatefulWidget {
  @override
  _UkulimaBoraLoadingIndicatorState createState() =>
      _UkulimaBoraLoadingIndicatorState();
}

class _UkulimaBoraLoadingIndicatorState
    extends State<UkulimaBoraLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: UkulimaBoraCommonColors.appGreenColor,
    );
  }
}
