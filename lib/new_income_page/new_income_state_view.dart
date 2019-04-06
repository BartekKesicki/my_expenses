import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/income_category.dart';

abstract class NewIncomeStateView extends BaseStateView {
  void buildIncomeCategoriesDropDownList(List<IncomeCategory> list);
  void buildTextFieldForNewCategory();
  void onIncomeInserted();
}