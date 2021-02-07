import 'package:flutter/material.dart';
import 'package:wirebo/screens/home_screen.dart';
import 'package:wirebo/screens/login_screen.dart';
import 'package:wirebo/screens/register_screen.dart';
import 'package:global_configuration/global_configuration.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("config.json");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wirebo',
        debugShowCheckedModeBanner: false,
        theme: _classTheme(),
        routes: {
          '/': (BuildContext context) => LoginScreen(),
          '/home': (BuildContext context) => HomeScreen(),
          '/signup': (BuildContext context) => RegisterScreen()
        });
  }

  _classTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Color(0xFFFEF9EB),
    );
  }
}
