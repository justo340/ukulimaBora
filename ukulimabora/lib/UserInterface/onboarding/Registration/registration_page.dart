import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/Shared/Widgets/common_text_input_field.dart';
import 'package:ukulimabora/routes/routes.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNumber;
  String pin1;
  String pin2;
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: UkulimaBoraCommonColors.appBackgroudColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const RegistrationHeader(),
              SizedBox(
                height: 20,
                child: RichText(
                  text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                        text: UkulimaBoraCommonText.alreadyAMemberText,
                        style: TextStyle(
                            fontSize: 16,
                            color: UkulimaBoraCommonColors.appBlackColor)),
                    const WidgetSpan(child: Text('')),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await Navigator.of(context).pushNamed(loginRoute);
                          },
                        text: UkulimaBoraCommonText.loginText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UkulimaBoraCommonColors.appBlueColor))
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    12, 0, 12, MediaQuery.of(context).viewInsets.bottom),
                height: 400,
                color: UkulimaBoraCommonColors.appBackgroudColor,
                child: Scrollbar(
                  child: ListView(
                    children: <Widget>[
                      Form(
                          key: _registrationFormKey,
                          child: Column(
                            children: <Widget>[
                              UkulimaBoraTextFormField(
                                icon: const Icon(Icons.person, size: 20),
                                obscuretext: false,
                                maximumLength: 15,
                                controller: textController,
                                hinttext: UkulimaBoraCommonText.firstNameText,
                                fillcolor: null,
                                keyboardtype: TextInputType.name,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return UkulimaBoraCommonText
                                        .noFirstNameMessage;
                                  } else if (val.length < 2) {
                                    return UkulimaBoraCommonText
                                        .shortFirstNameMessage;
                                  }
                                  return null;
                                },
                                onchanged: (String val) {
                                  firstName = val;
                                },
                                onsaved: (String val) {
                                  firstName = val;
                                  return;
                                },
                              ),
                              const SizedBox(height: 20),
                              UkulimaBoraTextFormField(
                                icon: const Icon(Icons.person, size: 20),
                                obscuretext: false,
                                maximumLength: 15,
                                controller: textController,
                                hinttext: UkulimaBoraCommonText.lastNameText,
                                fillcolor: null,
                                keyboardtype: TextInputType.name,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return UkulimaBoraCommonText
                                        .noLastNameMessage;
                                  } else if (val.length < 2) {
                                    return UkulimaBoraCommonText
                                        .shortLastNameMessage;
                                  }
                                  return null;
                                },
                                onchanged: (String val) {
                                  lastName = val;
                                },
                                onsaved: (String val) {
                                  lastName = val;
                                  return;
                                },
                              ),
                              const SizedBox(height: 20),
                              UkulimaBoraTextFormField(
                                icon: const Icon(Icons.phone, size: 20),
                                obscuretext: false,
                                maximumLength: 10,
                                controller: textController,
                                hinttext: UkulimaBoraCommonText.phoneText,
                                fillcolor: null,
                                keyboardtype: TextInputType.phone,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return UkulimaBoraCommonText.noPhoneMessage;
                                  } else if (val.length < 9) {
                                    return UkulimaBoraCommonText
                                        .shortPhoneMessage;
                                  } else if (val.length > 10) {
                                    return UkulimaBoraCommonText
                                        .longPhoneMessage;
                                  }
                                  return null;
                                },
                                onchanged: (String val) {
                                  phoneNumber = val;
                                },
                                onsaved: (String val) {
                                  phoneNumber = val;
                                  return;
                                },
                              ),
                              const SizedBox(height: 20),
                              UkulimaBoraTextFormField(
                                icon: const Icon(Icons.lock, size: 20),
                                obscuretext: true,
                                maximumLength: 4,
                                controller: textController,
                                hinttext: UkulimaBoraCommonText.pinText,
                                fillcolor: null,
                                keyboardtype: TextInputType.phone,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return UkulimaBoraCommonText.noPinMessage;
                                  } else if (val.length != 4) {
                                    return UkulimaBoraCommonText
                                        .invalidPinMessage;
                                  }
                                  return null;
                                },
                                onchanged: (String val) {
                                  pin1 = val;
                                },
                                onsaved: (String val) {
                                  pin1 = val;
                                  return;
                                },
                              ),
                              const SizedBox(height: 20),
                              UkulimaBoraTextFormField(
                                icon: const Icon(Icons.lock, size: 20),
                                obscuretext: true,
                                maximumLength: 4,
                                controller: textController,
                                hinttext:
                                    UkulimaBoraCommonText.pinConfirmationText,
                                fillcolor: null,
                                keyboardtype: TextInputType.phone,
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return UkulimaBoraCommonText.noPinMessage;
                                  } else if (val.length != 4) {
                                    return UkulimaBoraCommonText
                                        .invalidPinMessage;
                                  } else if (pin1 != val) {
                                    return UkulimaBoraCommonText
                                        .mismatchedPinMessage;
                                  }
                                  return null;
                                },
                                onchanged: (String val) {
                                  pin2 = val;
                                },
                                onsaved: (String val) {
                                  pin2 = val;
                                  return;
                                },
                              ),
                              const SizedBox(height: 20),
                              CommonAppButton(
                                buttonAction: () async {
                                  if (!_registrationFormKey.currentState
                                      .validate()) {
                                    return;
                                  }
                                  _registrationFormKey.currentState.save();

                                  await Navigator.of(context)
                                      .pushNamed(loginRoute);
                                },
                                buttonColor:
                                    UkulimaBoraCommonColors.appGreenColor,
                                buttonText: UkulimaBoraCommonText.registerText,
                                textColor:
                                    UkulimaBoraCommonColors.appWhiteColor,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: <Color>[Colors.green.shade400, Colors.blueGrey.shade900]),
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(150)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 3,
                color: UkulimaBoraCommonColors.appBlackColor)
          ]),
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 100,
            left: 12,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    UkulimaBoraCommonText.helloText,
                    style: TextStyle(
                      color: UkulimaBoraCommonColors.appBackgroudColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    UkulimaBoraCommonText.registerMainText,
                    style: TextStyle(
                      color: UkulimaBoraCommonColors.appBackgroudColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(UkulimaBoraCommonText.registerhelpText,
                      style: TextStyle(
                        color: UkulimaBoraCommonColors.appBackgroudColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
