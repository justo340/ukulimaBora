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
      @required this.onchanged,
      this.maximumLength,
      this.obscuretext,
      this.style,
      this.hintStyle,
      this.icon});

  final TextEditingController controller;
  final String hinttext;
  final Color fillcolor;
  final TextInputType keyboardtype;
  final String Function(String) validator;
  final Function(String) onsaved;
  final Function(String) onchanged;
  final int maximumLength;
  final bool obscuretext;
  final Widget icon;
  final TextStyle style;
  final TextStyle hintStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      obscureText: obscuretext,
      keyboardType: keyboardtype,
      controller: controller,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.disabled,
      enableSuggestions: false,
      validator: validator,
      onSaved: onsaved,
      onChanged: onchanged,
      maxLength: maximumLength,
      decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hinttext,
          hintStyle: hintStyle,
          fillColor: fillcolor,
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(70.0),
              ),
              borderSide: BorderSide(
                color: UkulimaBoraCommonColors.appBlueColor,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(70.0),
              ),
              borderSide: BorderSide(
                color: UkulimaBoraCommonColors.appRedColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(70.0),
              ),
              borderSide: BorderSide(
                color: UkulimaBoraCommonColors.appGreenColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(70.0),
              ),
              borderSide: BorderSide(
                color: UkulimaBoraCommonColors.appBlueColor,
              ))),
    );
  }
}
