import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/model/user.dart';

abstract class ProfileStateView extends BaseStateView {
  void fillUserData(User user);
  void fillExpensesData(int totalExpenses, double totalFunds);
}
