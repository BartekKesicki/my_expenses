import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/categories_page/outcome_category_tab_page/outcome_category_tab_state_view.dart';

class OutcomeCategoryTabStatePresenter extends BaseStatePresenter {

  OutcomeCategoryTabStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }
}