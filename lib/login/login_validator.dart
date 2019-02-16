

class LoginValidator {
  static bool emailIsValid(String value) {
    Pattern pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool fieldIsEmpty(String value) {
    return value.isEmpty;
  }
}