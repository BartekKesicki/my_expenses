import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/expense.dart';

abstract class ExpenseTabView extends BaseStateView {
  void showNoExpensesView();
  void updateExpensesList(List<Expense> expenses);
}
