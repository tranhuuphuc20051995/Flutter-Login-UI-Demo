import 'dart:async';

import 'package:flutter_login_demo/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get userStream => _userController.stream;

  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String userName, String password) {
    if (!Validations.isValidUserName(userName)) {
      _userController.sink.addError("Username không hợp lệ!");
      return false;
    }
    _userController.sink.add("OK");

    if (!Validations.isValidPassword(password)) {
      _passwordController.sink.addError("Password phải trên 6 ký tự!");
      return false;
    }
    _passwordController.sink.add("OK");
    return true;
  }

  void dispose() {
    _userController.close();
    _passwordController.close();
  }
}
