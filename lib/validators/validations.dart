class Validations {
  static bool isValidUserName(String userName) {
    return userName != null && userName.length > 6 && userName.contains("&");
  }

  static bool isValidPassword(String passWord) {
    return passWord != null && passWord.length > 6;
  }
}
