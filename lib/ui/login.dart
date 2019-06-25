import 'package:flutter/material.dart';
import 'package:flutter_login_demo/blocs/login_bloc.dart';
import 'package:flutter_login_demo/ui/forgot_password.dart';
import 'package:flutter_login_demo/ui/home.dart';
import 'package:flutter_login_demo/ui/sign_up.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = new LoginBloc();
  bool _showPass = false;
  TextEditingController _textUsernameEditingController =
      new TextEditingController();
  TextEditingController _textPasswordEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Container(
                      width: 70,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                      child: FlutterLogo(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Text(
                      "Hello\nWelcome Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: StreamBuilder(
                          stream: loginBloc.userStream,
                          builder: (context, snapShot) => TextField(
                                controller: _textUsernameEditingController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  labelStyle: TextStyle(
                                      color: Color(0xff888888), fontSize: 14),
                                  errorText:
                                      snapShot.hasError ? snapShot.error : null,
                                  errorStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        StreamBuilder(
                            stream: loginBloc.passwordStream,
                            builder: (context, snapShot) => TextField(
                                  controller: _textPasswordEditingController,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                        color: Color(0xff888888), fontSize: 14),
                                    errorText: snapShot.hasError
                                        ? snapShot.error
                                        : null,
                                  ),
                                  obscureText: !_showPass,
                                  keyboardType: TextInputType.text,
                                )),
                        GestureDetector(
                          child: Text(
                            !_showPass ? "SHOW" : "HIDE",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: _onShowHidePasswordClicked,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        onPressed: _onSignInClicked,
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "NEW USER?",
                                style: TextStyle(
                                  color: Color(0xff888888),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          onTap: _onSignUpClicked,
                        ),
                        GestureDetector(
                          child: Text(
                            "FORGOT PASSWORD?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                          onTap: _onForgotPasswordClicked,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void _onSignInClicked() {
    setState(() {
      if (loginBloc.isValidInfo(_textUsernameEditingController.text,
          _textPasswordEditingController.text)) {
        _goToHomePage();
      }
    });
  }

//  Widget goToHome(BuildContext buildContext) {
//    return HomePage();
//  }

  void _goToHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _onShowHidePasswordClicked() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void _onForgotPasswordClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }

  void _onSignUpClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}
