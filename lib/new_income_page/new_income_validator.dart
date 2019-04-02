
class NewIncomeValidator {
  static bool isIncomeNameValid(String value) {
    return value != null && value.isNotEmpty;
  }

  static bool isIncomeAmountValid(String value) {
    try {
      var valueInDouble = double.parse(value);
      return valueInDouble > 0;
    } catch(e) {
      return false;
    }
  }
}