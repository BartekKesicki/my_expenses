import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_view.dart';

class ExpenseTabPresenter extends BaseStatePresenter {
  ExpenseTabView view;
  ExpenseDatabaseHelper helper;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = ExpenseDatabaseHelper();
  }

  @override
  void detach() {
    this.view = null;
  }

  void loadExpensesList() async {
    await helper.getAllExpenses()
        .then((expenses) => view.showExpensesListView(expenses))
        .catchError(() => view.showNoExpensesView());
  }
}
