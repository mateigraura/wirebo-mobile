import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.name,
                    decoration: _inputDecoration("Username"),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                ),
                _separator(),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: _inputDecoration("Password"),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 25, right: 5),
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                _separator(),
                _loginBtn()
              ],
            ),
          ),
        ),
      ),
    );
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
        child: Text('Login'),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
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
