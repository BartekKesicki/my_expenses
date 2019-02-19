
class SignUpExpenseModel {
  bool _autoValidate = false;
  double startFunds;
  double income;
  double monthlyLimit;

  get getAutoValidate => _autoValidate;

  void setAutoValidate(bool value) {
    _autoValidate = value;
  }
}