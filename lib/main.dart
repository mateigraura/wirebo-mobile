import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:wirebo/screens/home_screen.dart';
import 'package:wirebo/screens/login_screen.dart';
import 'package:wirebo/screens/register_screen.dart';
import 'package:global_configuration/global_configuration.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("config.json");

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF19222C), // navigation bar color
      statusBarColor: Color(0xFF19222C)));

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
      primaryColor: Color(0xFF212D3B),
      scaffoldBackgroundColor: Color(0xFF1D2733),
      accentColor: Color(0xFFE9EEF4),
      canvasColor: Color(0xFF1B242F),
    );
  }
}
