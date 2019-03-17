import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_view.dart';
import 'package:my_expenses/db/helpers/expense_category_database_helper.dart';

class ExpenseCategoryTabStatePresenter extends BaseStatePresenter {

  ExpenseCategoryTabStateView view;
  ExpenseCategoryDatabaseHelper helper;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = ExpenseCategoryDatabaseHelper();
  }

  @override
  void detach() {
    this.view = null;
  }

  void loadExpensesCategories() async {
    await helper.getAllExpenseCategories()
        .then((onValue) => view.showExpensesCategoriesView(onValue))
        .catchError((onError) => view.showNoExpenseCategoriesView());
  }
}