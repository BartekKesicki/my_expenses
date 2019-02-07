import 'package:my_expenses/base/base_state_view.dart';

abstract class SignUpPersonalDataStateView extends BaseStateView {
    void signUpUser();
    void showError();
    void redirectToLoginPage();
}