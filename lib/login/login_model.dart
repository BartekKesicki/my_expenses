class LoginModel {
  String email;
  String password;
  bool _autoValidate = false;

  get getEmail => email;

  get getPassword => password;

  get getAutoValidate => _autoValidate;

  void setAutoValidate(bool value) {
    _autoValidate = value;
  }
}
