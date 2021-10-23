import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ukulimabora/Infrustracture/Models/network_connection.dart';
import 'package:ukulimabora/Infrustracture/Services/Application_bloc.dart';
import 'package:ukulimabora/Infrustracture/Services/Authentication_service.dart';
import 'package:ukulimabora/UserInterface/onboarding/Login/login_page.dart';
import 'package:ukulimabora/UserInterface/onboarding/Welcome/bottom_navigation.dart';

// import 'package:ukulimabora/routes/router_generator.dart';
// import 'package:ukulimabora/routes/routes.dart';

// import 'Infrustracture/Models/network_connection.dart';
// import 'Shared/Common/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
          <DeviceOrientation>[DeviceOrientation.portraitUp])
      .then((_) => runApp(UkulimaBora()));
}

class UkulimaBora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ApplicationBloc>(
          create: (BuildContext context) => ApplicationBloc(),
        ),
        Provider<AuthenticationService>(
          create: (BuildContext context) =>
              AuthenticationService(firebaseAuth: FirebaseAuth.instance),
        ),
        StreamProvider<User>(
            create: (BuildContext context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null)
      ],
      child: Builder(builder: (BuildContext context) {
        return NetworkConnectivity();
      }),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper();

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return BottomNavigation();
    }
    return LoginPage();
  }
}
