import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/expense_category.dart';

abstract class ExpenseCategoryTabStateView extends BaseStateView {
  void showNoExpenseCategoriesView();
  void updateExpensesCategoriesList(List<ExpenseCategory> categories);
  void showErrorMessage(String message);
}
