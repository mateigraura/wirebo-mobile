import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:wirebo/screens/home_screen.dart';
import 'package:wirebo/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

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
          '/home': (BuildContext context) => HomeScreen()
        });
  }

  _classTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Color(0xFFFEF9EB),
    );
  }
}
