import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/db/helpers/shared_preferences_helper.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:my_expenses/my_profile_page/profile_state_view.dart';

class ProfileStatePresenter extends BaseStatePresenter {
  ProfileStateView view;
  var _userDbHelper = UserDatabaseHelper();
  var _expenseDbHelper = ExpenseDatabaseHelper();
  var _sharedPreferencesHelper = SharedPreferencesHelper();

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }

  void performLoadProfileData() async {
    await _sharedPreferencesHelper.getLanguageCode()
        .then((id) => getProfileData(id))
        .catchError((onError) => view.showMessage(onError.toString()));
  }

  void getProfileData(int id) async {
    await _userDbHelper.getUser(id)
        .then((user) => getExpensesData(user))
        .catchError((onError) => view.showMessage("ERROR"));
  }

  void getExpensesData(User user) async {
    view.fillUserData(user);
    await _expenseDbHelper.getAllExpenses()
        .then((expenses) => view.fillExpensesData(expenses != null ? expenses.length : 0, user.startFunds))
        .catchError((onError) => view.showMessage("ERROR"));
  }
}
