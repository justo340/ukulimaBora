import 'package:flutter/material.dart';

class UkulimaBoraCommonText {
  static String appName = 'Ukulima Bora';
  static String loginText = 'Login';
  static String registerText = 'Sign Up';
  static String welcomeText = 'Welcome';
  static String genericErrorMessage =
      'An error occured, press the button to retry';
  static String retryMessage = 'Retry';
  static String doneMessage = 'Done';
  static String phoneText = 'Phone Number';
  static String pinText = 'PIN';
  static String pinConfirmationText = 'confirm PIN';
  static String lastNameText = 'Last Name';
  static String firstNameText = 'First Name';
  static String noPhoneMessage = 'valid phone number is required';
  static String noLastNameMessage = 'last name is required';
  static String noPinMessage = 'PIN is required';
  static String mismatchedPinMessage = 'PIN do not match';
  static String noFirstNameMessage = 'first name is required';
  static String shortPhoneMessage = 'phone number is too short';
  static String longPhoneMessage = 'phone number is too long';
  static String shortLastNameMessage = 'last name is too short';
  static String shortFirstNameMessage = 'first name is too short';
}

class UkulimaBoraCommonColors {
  static MaterialColor appGreenColor = Colors.green;
  static Color appBackgroudColor = Colors.grey[200];
  static Color appWhiteColor = Colors.white;
  static Color appBlackColor = Colors.black38;
  static Color appBlueColor = Colors.blue;
}

class UkulimaBoraCustomSpaces {
  static EdgeInsets normalMarginSpacing = const EdgeInsets.all(12);
  static EdgeInsets bottomMarginSpacing =
      const EdgeInsets.fromLTRB(12, 6, 12, 12);
}
