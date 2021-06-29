import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/Shared/Widgets/common_text_input_field.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Image.asset(
              'assets/images/leaf.png',
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  UkulimaBoraCommonText.registerText,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                const Text('to get access to various farming insights',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
              child: const UkulimaBoraTextFormField(
            controller: null,
          )),
          const CommonAppButton(
            buttonAction: null,
            buttonColor: null,
            buttonText: '',
            textColor: null,
          )
        ],
      ),
    ));
  }
}
