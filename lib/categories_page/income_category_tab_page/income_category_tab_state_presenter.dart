import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_view.dart';
import 'package:my_expenses/db/helpers/income_category_database_helper.dart';

class IncomeCategoryTabStatePresenter extends BaseStatePresenter {
  IncomeCategoryTabStateView view;
  IncomeCategoryDatabaseHelper helper;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = IncomeCategoryDatabaseHelper();
  }

  @override
  void detach() {
    this.view = null;
  }

  void loadIncomeCategories() async {
    await helper
        .getAllIncomeCategories()
        .then((onValue) => view.updateIncomeCategoriesList(onValue))
        .catchError((onError) => view.showNoIncomeCategoryView());
  }
}
