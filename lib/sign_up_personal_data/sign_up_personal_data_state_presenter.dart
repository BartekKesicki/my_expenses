import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_state_view.dart';

class SignUpPersonalDataStatePresenter extends BaseStatePresenter {

  SignUpPersonalDataStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  void performToMoveToNextPage() {
    //todo validation
    view.redirectToNextPage();
  }

  @override
  void detach() {
    view = null;
  }
}
