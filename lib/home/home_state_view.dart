import 'package:my_expenses/base/base_state_view.dart';

abstract class HomeStateView extends BaseStateView {
  void redirectToAddNewExpensePage(int userId);
}