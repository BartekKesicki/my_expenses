import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/login/login_state_view.dart';

class LoginStatePresenter extends BaseStatePresenter {

  LoginStateView view;

  void performLogin(String login, String password) {
    //todo perform login
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