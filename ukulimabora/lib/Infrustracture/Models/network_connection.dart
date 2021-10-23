import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/error_page.dart';
import 'package:ukulimabora/main.dart';
import 'package:ukulimabora/routes/router_generator.dart';
import 'package:ukulimabora/routes/routes.dart';

class NetworkConnectivity extends StatefulWidget {
  @override
  _NetworkConnectivityState createState() => _NetworkConnectivityState();
}

class _NetworkConnectivityState extends State<NetworkConnectivity> {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    if (!mounted) {
      return Future<void>.value();
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (connectionStatus.toString() == 'ConnectivityResult.none') {
      return MaterialApp(
          initialRoute: welcomeRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'UkulimaBora',
          theme: ThemeData(
              primaryColor: UkulimaBoraCommonColors.appBackgroudColor,
              scaffoldBackgroundColor: UkulimaBoraCommonColors.appWhiteColor),
          home: ErrorPage(
            errorTitle: UkulimaBoraCommonText.networkErrorTitle,
            errorMessage: UkulimaBoraCommonText.networkErrorMessage,
          ));
    }
    return MaterialApp(
        initialRoute: welcomeRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'UkulimaBora',
        theme: ThemeData(
            primaryColor: UkulimaBoraCommonColors.appBackgroudColor,
            scaffoldBackgroundColor: UkulimaBoraCommonColors.appWhiteColor),
        home: const AuthenticationWrapper());
  }
}
