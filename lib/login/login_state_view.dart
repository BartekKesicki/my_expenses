import 'package:my_expenses/base/base_state_view.dart';

abstract class LoginStateView extends BaseStateView {
  void redirectToHomePage(int userId);
  void redirectToSignUpPage();
  void autoValidate();
}
