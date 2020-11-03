import 'package:flutter/material.dart';
import 'package:wirebo/screens/home_screen.dart';
import 'package:wirebo/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wirebo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Color(0xFFFEF9EB),
      ),
      routes: {
        '/': (BuildContext context) => LoginScreen(),
        '/home': (BuildContext context) => HomeScreen()
      },
    );
  }
}
