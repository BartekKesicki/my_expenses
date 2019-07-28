import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/income_database_helper.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_view.dart';

class IncomeTabPresenter extends BaseStatePresenter {
  IncomeTabView view;
  IncomeDatabaseHelper helper;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = IncomeDatabaseHelper();
  }

  @override
  void detach() {
    this.view = null;
  }

  void loadIncomesList() async {
    await helper
        .getAllIncomes()
        .then((incomes) => view.updateIncomesList(incomes))
        .catchError((onError) => view.showNoIncomesView());
  }

  void loadIncomesByName(String phrase) async {
    await helper.getIncomeByName(phrase)
        .then((incomes) => view.updateIncomesList(incomes))
        .catchError((error) => view.showMessage(error.toString()));
  }
}
