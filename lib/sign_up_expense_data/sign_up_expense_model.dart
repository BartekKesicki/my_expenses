
class SignUpExpenseModel {
  bool _autoValidate = false;
  String startFunds;
  String income;
  String monthlyLimit;

  get getAutoValidate => _autoValidate;

  void setAutoValidate(bool value) {
    _autoValidate = value;
  }
}