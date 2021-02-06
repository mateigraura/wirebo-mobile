import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wirebo/utils/constants.dart';
import 'package:wirebo/extensions/string_extensions.dart';
import 'package:wirebo/services/auth_service.dart' as auth;
import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;

  final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  Future isLoggedIn() async {
    final token = await keyValueStore.read("authToken");
    if (token.isNotEmpty || token != 'null') {
      Navigator.pushNamed(context, '/home');
    }
  }

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Wirebo',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.name,
                    decoration: _inputDecoration("Email"),
                    onChanged: (String value) {
                      this.email = value;
                    },
                    controller: fieldText,
                  ),
                ),
                _separator(),
                TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: _inputDecoration("Password"),
                  onChanged: (String value) {
                    this.password = value;
                  },
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 25, right: 5),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                _separator(),
                _loginBtn(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 25, right: 5),
                    child: Text(
                      'Sign-up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showMaterialDialog(String value) {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              content: new Text(value),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _separator() {
    return SizedBox(
      height: 25,
    );
  }

  _loginBtn() {
    return FlatButton(
        padding: EdgeInsets.only(left: 50, right: 50),
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: Colors.white)),
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () async {
          if (!this.email.isValidEmail()) {
            _showMaterialDialog("Incorrect email");
          }
          String result = await auth.login(this.email, this.password);

          if (result != loginSuccessful) {
            _showMaterialDialog(result);
          } else {
            Navigator.pushNamed(context, '/home');
          }
        });
  }

  _inputDecoration(final String labelText) {
    return InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelStyle: TextStyle(color: Colors.white),
        labelText: labelText);
  }
}
