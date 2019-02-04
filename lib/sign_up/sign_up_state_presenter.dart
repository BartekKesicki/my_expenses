import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/sign_up/sign_up_state_view.dart';

class SignUpStatePresenter extends BaseStatePresenter {

  SignUpStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    view = null;
  }
}
