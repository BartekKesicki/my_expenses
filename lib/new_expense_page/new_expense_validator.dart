class NewExpenseValidator {
  static bool isExpenseNameValid(String value) {
    return value != null && value.isNotEmpty;
  }

  static bool isExpenseAmountValid(String value) {
    try {
      var valueInDouble = double.parse(value);
      return valueInDouble > 0;
    } catch(e) {
      return false;
    }
  }
}