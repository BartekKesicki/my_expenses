
import 'package:my_expenses/constants/common_constants.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';

class SignUpExpenseDataValidator {

  String validateNumberInput(String value) {
    if (value == CommonConstants.EMPTY_STRING) {
      return ValidationMessagesConstants.THIS_FIELD_CANT_BE_EMPTY;
    } else if (double.parse(value) > 0) {
      return ValidationMessagesConstants.VALUE_CANT_BE_BELOW_ZERO;
    }
    return null;
  }

  String validateMonthlyLimit(String value) {
    if (double.parse(value) > 0) {
      return ValidationMessagesConstants.VALUE_CANT_BE_BELOW_ZERO;
    }
    return null;
  }
}