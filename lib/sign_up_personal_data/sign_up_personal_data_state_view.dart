import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';

abstract class SignUpPersonalDataStateView extends BaseStateView {
  void redirectToNextPage(SignUpPersonalDataModel model);
  void showError();
  void redirectToLoginPage();
  void autoValidate();
}
