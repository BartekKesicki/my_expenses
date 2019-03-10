class SignUpExpenseDataValidator {
  static bool numberIsEmpty(String value) {
    return value.isEmpty;
  }

  static bool numberIsNotBelowZero(String value) {
    return double.parse(value) > 0;
  }

  static bool incomeIsLowerThanMonthlyLimit(String value) {
    return double.parse(value) <= 0;
  }
}
