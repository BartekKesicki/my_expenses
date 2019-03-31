import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/new_income_page/new_income_state_view.dart';

class NewIncomeStatePresenter extends BaseStatePresenter {

  NewIncomeStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    view = null;
  }
}