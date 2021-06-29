import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class CommonAppButton extends StatefulWidget {
  const CommonAppButton(
      {@required this.buttonText,
      @required this.buttonAction,
      @required this.buttonColor,
      @required this.textColor});

  final String buttonText;
  final Function() buttonAction;
  final Color buttonColor;
  final Color textColor;

  @override
  _CommonAppButtonState createState() => _CommonAppButtonState();
}

class _CommonAppButtonState extends State<CommonAppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
      width: 200,
      decoration: BoxDecoration(
          color: widget.buttonColor, borderRadius: BorderRadius.circular(12)),
      child: TextButton(
          onPressed: widget.buttonAction,
          child: Text(
            widget.buttonText,
            style: TextStyle(color: widget.textColor, fontSize: 18),
          )),
    );
  }
}
