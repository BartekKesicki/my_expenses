
class SignUpPersonalDataValidator {

  static bool textFormFieldIsEmpty(String value) {
    return value.isEmpty;
  }

  static bool emailIsValid(String value) {
    Pattern pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool passwordsAreEqual(String password, String confirmPassword) {
    return password != confirmPassword;
  }
}