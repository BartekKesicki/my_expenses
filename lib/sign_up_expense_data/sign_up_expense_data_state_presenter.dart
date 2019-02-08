import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';

class SignUpExpenseDataStatePresenter extends BaseStatePresenter {

  SignUpExpenseDataStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    view = null;
  }
}