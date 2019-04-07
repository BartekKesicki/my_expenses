import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/expense_category.dart';

abstract class NewExpenseStateView extends BaseStateView {
  void buildExpenseCategoriesDropDownList(List<ExpenseCategory> list);
  void buildTextFieldForNewCategory();
  void onExpenseInserted();
}