import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/group.dart';

abstract class ExpenseTabView extends BaseStateView {
  void showNoExpensesView();
  void showExpensesListView(List<Group> expenses);
}
