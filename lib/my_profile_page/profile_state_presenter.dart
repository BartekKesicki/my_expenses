import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/db/helpers/shared_preferences_helper.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
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

  void calculateData() async {
    int userId = await _sharedPreferencesHelper.getLanguageCode();
    //todo get user and expense data
  }
}
