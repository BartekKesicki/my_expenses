import 'package:my_expenses/base/base_state_view.dart';

abstract class NewExpenseCategoryStateView extends BaseStateView {
  void showInsertionSuccess();
  void showInsertionFailure();
}