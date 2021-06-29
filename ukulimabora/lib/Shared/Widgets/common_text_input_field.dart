import 'package:flutter/material.dart';

class UkulimaBoraTextFormField extends StatefulWidget {
  const UkulimaBoraTextFormField({
    @required this.controller,
  });

  final TextEditingController controller;
  @override
  _UkulimaBoraTextFormFieldState createState() =>
      _UkulimaBoraTextFormFieldState();
}

class _UkulimaBoraTextFormFieldState extends State<UkulimaBoraTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: ,
      // controller: controller,
      autocorrect: false,
      autofocus: true,
      // validator: ,
      // decoration: ,
    );
  }
}
