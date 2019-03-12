import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_view.dart';

class IncomeCategoryTabStatePresenter extends BaseStatePresenter {

  IncomeCategoryTabStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }
}