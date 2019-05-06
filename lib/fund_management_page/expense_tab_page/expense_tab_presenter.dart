import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:date_format/date_format.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_view.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/group.dart';

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
        .then((expenses) => createGroupedExpenses(expenses))
        .catchError(() => view.showNoExpensesView());
  }

  void createGroupedExpenses(List<Expense> expenses) {
    if (expenses != null && expenses.isNotEmpty) {
      List<Group> groupedExpenses = new List();
      for (var expense in expenses) {
        groupedExpenses.add(createGroupedExpense(expense));
      }
      view.showExpensesListView(groupedExpenses);
    } else {
      view.showNoExpensesView();
    }
  }

  Group createGroupedExpense(Expense expense) {
    return new Group(formatDate(DateTime.fromMillisecondsSinceEpoch(expense.timestamp), [dd, '/', mm, '/', yyyy]), expense);
  }
}
