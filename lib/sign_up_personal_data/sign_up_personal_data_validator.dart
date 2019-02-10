import 'package:my_expenses/constants/common_constants.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';

class SignUpPersonalDataValidator {

  String textFormFieldIsNotEmpty(String value) {
    if (value == CommonConstants.EMPTY_STRING) {
      return ValidationMessagesConstants.THIS_FIELD_CANT_BE_EMPTY;
    }
    return null;
  }

  String emailIsValid(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return ValidationMessagesConstants.INCORRECT_EMAIL;
    else
      return null;
  }

  String passwordsAreEqual(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return ValidationMessagesConstants.PASSWORDS_ARE_NOT_EQUAL;
    }
    return null;
  }
}