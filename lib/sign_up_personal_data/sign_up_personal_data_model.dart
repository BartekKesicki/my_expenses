class SignUpPersonalDataModel {
  bool _autoValidate = false;
  String email;
  String password;
  String confirmPassword;

  get getAutoValidate => _autoValidate;

  void setAutoValidate(bool value) {
    _autoValidate = value;
  }
}
