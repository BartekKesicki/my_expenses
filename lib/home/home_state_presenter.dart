import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/home/home_state_view.dart';

class HomeStatePresenter extends BaseStatePresenter {
  HomeStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }

  void performLaunchNewExpense(int userId) {
    view.redirectToAddNewExpensePage(userId);
  }
}
