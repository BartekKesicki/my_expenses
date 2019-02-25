
class LoginModel {
  String email;
  String password;
  bool _autoValidate = false;

  get getAutoValidate => _autoValidate;

  get getEmail => email;

  get getPassword => password;

  void setAutoValidate(bool value) {
    _autoValidate = value;
  }
}