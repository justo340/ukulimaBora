import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Widgets/constants.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    @required this.buttonText,
    @required this.buttonAction,
  });

  final String buttonText;
  final Function buttonAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: UkulimaBoraCustomSpaces.normalMarginSpacing,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: UkulimaBoraCommonColors.appGreenColor,
          borderRadius: BorderRadius.circular(12)),
      child: TextButton(
          onPressed: () => buttonAction,
          child: Text(
            buttonText,
            style: TextStyle(
                color: UkulimaBoraCommonColors.appWhiteColor, fontSize: 18),
          )),
    );
  }
}
