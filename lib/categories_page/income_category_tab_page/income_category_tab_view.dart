import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/income_category.dart';

abstract class IncomeCategoryTabStateView extends BaseStateView {
  void showNoIncomeCategoryView();
  void updateIncomeCategoriesList(List<IncomeCategory> incomeCategories);
}
