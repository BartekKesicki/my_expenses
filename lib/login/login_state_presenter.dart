import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/login/login_state_view.dart';
import 'package:my_expenses/login/login_validator.dart';

class LoginStatePresenter extends BaseStatePresenter {

  LoginStateView view;

  void performLogin(String login, String password) {
    //todo perform login
  }

  bool emailIsValid(String email) {
    return LoginValidator.emailIsValid(email);
  }

  bool passwordIsValid(String password) {
    return !LoginValidator.fieldIsEmpty(password);
  }

  bool loginAndPasswordIsValid(String login, String password) {
    //todo check if user exists
    return true;
  }

  void performToLaunchSignUpPage() {
    view.redirectToSignUpPage();
  }

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    view = null;
  }
}