import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/income.dart';

abstract class IncomeTabView extends BaseStateView {
  void showIncomesListView(List<Income> incomes);
  void showNoIncomesView();
}
