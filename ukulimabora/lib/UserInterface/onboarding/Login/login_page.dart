import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ukulimabora/Infrustracture/Services/Authentication_service.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/Shared/Widgets/common_text_input_field.dart';
import 'package:ukulimabora/routes/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email;
  String pin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: <Color>[
                  UkulimaBoraCommonColors.appLightGreenColor,
                  UkulimaBoraCommonColors.appVeryBlackColor
                ]),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              const LoginHeader(),
              Container(
                padding: EdgeInsets.fromLTRB(
                    12, 0, 12, MediaQuery.of(context).viewInsets.bottom),
                decoration: BoxDecoration(
                    color: UkulimaBoraCommonColors.appBackgroudColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                height: MediaQuery.of(context).size.height / 1.7,
                child: Scrollbar(
                  child: ListView(shrinkWrap: true, children: <Widget>[
                    const SizedBox(height: 90),
                    Form(
                        key: _loginFormKey,
                        child: Column(children: <Widget>[
                          UkulimaBoraTextFormField(
                            icon: const Icon(Icons.email, size: 20),
                            obscuretext: false,
                            controller: emailController,
                            hinttext: UkulimaBoraCommonText.emailText,
                            fillcolor: null,
                            keyboardtype: TextInputType.emailAddress,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return UkulimaBoraCommonText.noEmailMessage;
                              } else if (emailRegexp.hasMatch(val) == false) {
                                return UkulimaBoraCommonText.noEmailMessage;
                              }
                              return null;
                            },
                            onchanged: (String val) {
                              email = val;
                            },
                            onsaved: (String val) {
                              email = val;
                              return;
                            },
                          ),
                          const SizedBox(height: 20),
                          UkulimaBoraTextFormField(
                            icon: const Icon(Icons.lock, size: 20),
                            obscuretext: true,
                            maximumLength: 6,
                            controller: passwordController,
                            hinttext: UkulimaBoraCommonText.pinText,
                            fillcolor: null,
                            keyboardtype: TextInputType.phone,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return UkulimaBoraCommonText.noPinMessage;
                              } else if (val.length != 6) {
                                return UkulimaBoraCommonText.invalidPinMessage;
                              }
                              return null;
                            },
                            onchanged: (String val) {
                              pin = val;
                            },
                            onsaved: (String val) {
                              pin = val;
                              return;
                            },
                          ),
                          const SizedBox(height: 20),
                          CommonAppButton(
                            buttonAction: () async {
                              if (!_loginFormKey.currentState.validate()) {
                                return;
                              }
                              _loginFormKey.currentState.save();

                              context.read<AuthenticationService>().signIn(
                                  email: emailController.text,
                                  password: passwordController.text);

                              if (FirebaseAuthException != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            UkulimaBoraCommonText.noUserText)));

                                await Navigator.of(context)
                                    .pushNamed(loginRoute);
                              } else {
                                await Navigator.of(context)
                                    .pushNamed(homeRoute);
                              }
                            },
                            buttonColor: UkulimaBoraCommonColors.appGreenColor,
                            buttonText: UkulimaBoraCommonText.loginText,
                            textColor: UkulimaBoraCommonColors.appWhiteColor,
                          ),
                          SizedBox(
                            height: 20,
                            child: RichText(
                              text: TextSpan(children: <InlineSpan>[
                                TextSpan(
                                    text: UkulimaBoraCommonText.noAccountText,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: UkulimaBoraCommonColors
                                            .appBlackColor)),
                                const WidgetSpan(child: Text('')),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await Navigator.of(context)
                                            .pushNamed(registrationRoute);
                                      },
                                    text: UkulimaBoraCommonText.registerText,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UkulimaBoraCommonColors
                                            .appBlueColor))
                              ]),
                            ),
                          ),
                        ]))
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 100,
            left: 12,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    UkulimaBoraCommonText.welcomeText,
                    style: TextStyle(
                      color: UkulimaBoraCommonColors.appBackgroudColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    UkulimaBoraCommonText.loginMainText,
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
