import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Widgets/common_appbar.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        CommonAppBar(),
      ],
    ));
  }
}
