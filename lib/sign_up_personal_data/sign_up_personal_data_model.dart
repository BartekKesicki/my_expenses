class SignUpPersonalDataModel {
  bool _autoValidate = false;
  String email;
  String password;
  String confirmPassword;
  String photoPath = "";

  get getAutoValidate => _autoValidate;

  void setAutoValidate(bool value) {
    _autoValidate = value;
  }
}
