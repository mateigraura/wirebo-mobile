import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wirebo/utils/constants.dart';
import 'package:wirebo/extensions/string_extensions.dart';
import 'package:wirebo/services/auth_service.dart' as auth;

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name, email, password, username;

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
                          )),
                      _nameInput(),
                      _emailInput(),
                      _passwordInput(),
                      _usernameInput(),
                      _separator(),
                      _registerBtn()
                    ]),
              ),
            )));
  }

  _nameInput() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: TextField(
          style: TextStyle(color: Colors.white, fontSize: 15),
          textInputAction: TextInputAction.none,
          keyboardType: TextInputType.name,
          decoration: _inputDecoration('Name'),
          onChanged: (String value) {
            this.name = value;
          },
        ));
  }

  _emailInput() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 15),
        textInputAction: TextInputAction.none,
        keyboardType: TextInputType.emailAddress,
        decoration: _inputDecoration("Email"),
        onChanged: (String value) {
          this.email = value;
        },
      ),
    );
  }

  _passwordInput() {
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 15),
      obscureText: true,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration("Password"),
      onChanged: (String value) {
        this.password = value;
      },
    );
  }

  _usernameInput() {
    return Container(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: TextField(
          style: TextStyle(color: Colors.white, fontSize: 15),
          textInputAction: TextInputAction.none,
          keyboardType: TextInputType.name,
          decoration: _inputDecoration('Username'),
          onChanged: (String value) {
            this.username = value;
          },
        ));
  }

  _registerBtn() {
    return FlatButton(
        padding: EdgeInsets.only(left: 50, right: 50),
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: Colors.white)),
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () async {
          if (!this.email.isValidEmail()) {
            _showMaterialDialog("Incorrect email");
          }

          String result = await auth.register(<String, String>{
            'name': this.name,
            'email': this.email,
            'password': this.password,
            'username': this.username
          });

          if (result != okMessage) {
            _showMaterialDialog(result);
          } else {
            Navigator.pushNamed(context, '/home');
          }
        });
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

  _separator() {
    return SizedBox(
      height: 25,
    );
  }
}
