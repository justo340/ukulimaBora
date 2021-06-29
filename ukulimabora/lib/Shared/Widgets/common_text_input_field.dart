import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class UkulimaBoraTextFormField extends StatelessWidget {
  const UkulimaBoraTextFormField(
      {@required this.fillcolor,
      @required this.controller,
      @required this.hinttext,
      @required this.keyboardtype,
      @required this.validator,
      @required this.onsaved,
      this.maximumLength});

  final TextEditingController controller;
  final String hinttext;
  final Color fillcolor;
  final TextInputType keyboardtype;
  final String Function(String) validator;
  final String Function(String) onsaved;
  final int maximumLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      controller: controller,
      autocorrect: false,
      validator: validator,
      onSaved: onsaved,
      maxLength: maximumLength,
      decoration: InputDecoration(
          hintText: hinttext,
          fillColor: fillcolor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: UkulimaBoraCommonColors.appGreenColor, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: UkulimaBoraCommonColors.appBlueColor, width: 2.0))),
    );
  }
}
