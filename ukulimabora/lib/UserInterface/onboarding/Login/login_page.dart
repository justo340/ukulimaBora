import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Widgets/appbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[CommonAppBar(), ListView()],
    ));
  }
}
