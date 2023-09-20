import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class OnboardingButton extends StatefulWidget {
  const OnboardingButton({
    required this.buttonText,
    required this.buttonAction,
  });

  final String buttonText;
  final Function() buttonAction;

  @override
  _OnboardingButtonState createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: UkulimaBoraCommonColors.appGreenColor,
          borderRadius: BorderRadius.circular(70),),
      child: TextButton(
          onPressed: widget.buttonAction,
          child: Text(
            widget.buttonText,
            style: TextStyle(
                color: UkulimaBoraCommonColors.appWhiteColor, fontSize: 18,),
          ),),
    );
  }
}
