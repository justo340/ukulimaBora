import 'package:flutter/material.dart';

class UkulimaBoraCommonText {
  static String helloText = 'Hello';
  static String appName = 'Ukulima Bora';
  static String loginText = 'Login';
  static String logoutText = 'LogOut';
  static String registerText = 'Sign Up';
  static String welcomeText = 'Welcome';
  static String genericErrorTitle = 'An error occured';
  static String genericErrorMessage = 'press the button to retry';
  static String networkErrorTitle = 'No Network Connection ';
  static String networkErrorMessage =
      ''' Please connect to the internet and press the button to retry''';
  static String retryMessage = 'Retry';
  static String profileMessage = 'Profile';
  static String personalInfoHeader = 'Personal Information';
  static String applicationInfoHeader = 'Application Information';
  static String doneMessage = 'Done';
  static String saveMessage = 'Save';
  static String phoneText = 'Phone Number';
  static String emailText = 'Email Address';
  static String pinText = 'PIN';
  static String pinConfirmationText = 'confirm PIN';
  static String lastNameText = 'Last Name';
  static String firstNameText = 'First Name';
  static String noPhoneMessage = 'Valid phone number is required';
  static String noEmailMessage = 'Valid email address is required';
  static String noLastNameMessage = 'Last name is required';
  static String noPinMessage = 'PIN is required';
  static String mismatchedPinMessage = 'PIN do not match';
  static String noFirstNameMessage = 'First name is required';
  static String shortPhoneMessage = 'Phone number is too short';
  static String longPhoneMessage = 'Phone number is too long';
  static String shortLastNameMessage = 'Last name is too short';
  static String shortFirstNameMessage = 'First name is too short';
  static String invalidPinMessage = 'Enter a 6 digit PIN ';
  static String registerhelpText = 'To get access to awesome farming insights';
  static String registerMainText = 'Create Account';
  static String registerErrorText =
      'Error occured while signing up please try again';
  static String loginMainText = 'Sign In';
  static String alreadyAMemberText = 'Already have an Account ';
  static String noAccountText = 'Have no Account ';
  static String noUserText = 'User does not exist sign up and try again ';
  static String todayQuestionText = 'What would you like to do today?';
  static String addFarmTitle = 'Add Your Farm';
  static String notificationText = 'Notifications';
  static String taskText = 'Tasks';
  static String noPlaceMessage = 'Valid location is required';
  static String placeText = 'Search Location';
  static String descriptionText = 'Enter description';
  static String cropSelectionText = 'Select Crop';
  static String landPrepText = 'Land Prep';
  static String plantingText = 'Planting';
  static String fertilizerText = 'Apply Fertilizer';
  static String irrigationText = 'Irrigation';
  static String pesticideText = 'Apply Pesticide';
  static String harvestText = 'Harvesting';
  static String supportText = 'Support for more crops will be added';
  static String suggestionText = 'Suggested Days';
  static String mapText = 'Map';
  static String weatherText = 'Weather Update';
  static String dailyForecastText = 'Daily Forecast';
}

class UkulimaBoraCommonColors {
  static MaterialColor appGreenColor = Colors.green;
  static Color appBackgroudColor = Colors.grey[200];
  static Color appWhiteColor = Colors.white;
  static Color appBlackColor = Colors.black38;
  static Color appBlueColor = Colors.blue;
  static Color appRedColor = Colors.red;
  static Color appgreyColor = Colors.grey[400];
  static Color appVeryBlackColor = Colors.blueGrey.shade900;
  static Color appLightGreenColor = Colors.green.shade400;
}

class UkulimaBoraCustomSpaces {
  static EdgeInsets largerMarginSpacing = const EdgeInsets.all(16);
  static EdgeInsets normalMarginSpacing = const EdgeInsets.all(12);
  static EdgeInsets smallMarginSpacing = const EdgeInsets.all(8);
  static EdgeInsets bottomMarginSpacing =
      const EdgeInsets.fromLTRB(12, 6, 12, 12);
}

class UkulimaBoraActivities {
  static String havest = 'Harvest';
  static String plant = 'Plant';
  static String pesticide = 'Apply Pesticide';
  static String irrigate = 'Irrigate';
  static String fertilizer = 'Apply fertilizer';
  static String land = 'Land prep';
}

class UkulimaBoraDivider {
  static Widget normaldivider = SizedBox(
    height: 10,
    child: Divider(
      color: UkulimaBoraCommonColors.appBackgroudColor,
    ),
  );
}

class UkulimaBoraCrops {
  static String maizeText = 'Maize';
  static String beansText = 'Beans';
  static String potatoText = 'Potato';
  static String bananaText = 'Banana';
}

RegExp emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class OptimalConditions {
  static List<dynamic> optimalDayPlantingTemparatures = <dynamic>[
    18,
    19,
    20,
    21,
    22
  ];
  static List<dynamic> optimalNightPlantingTemparatures = <dynamic>[
    10,
    11,
    12,
    14
  ];

  static List<dynamic> optimalIrrigationTemparatures = <dynamic>[
    21,
    22,
    23,
    24,
    25,
    26,
    27
  ];

  static List<dynamic> optimalWind = <dynamic>[1, 2, 3, 4, 5, 6];
  static List<dynamic> optimalharvestingTemparatures = <dynamic>[
    27,
    28,
    29,
    30
  ];
  static List<dynamic> optimalharvestinghumidity = <dynamic>[
    68,
    69,
    70,
    71,
    72,
    73,
    74
  ];
}
