import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/fund_management_page/outcome_tab_page/expense_tab_view.dart';

class ExpenseTabPresenter extends BaseStatePresenter {
  ExpenseTabView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }

  void loadExpensesList() {
    //todo load expenses list
  }
}
