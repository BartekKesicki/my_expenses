import 'package:my_expenses/base/base_state_view.dart';

abstract class SignUpPersonalDataStateView extends BaseStateView {
    void redirectToNextPage();
    void showError();
    void redirectToLoginPage();
}