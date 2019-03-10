import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/fund_management_page/fund_management_state_view.dart';

class FundManagementStatePresenter extends BaseStatePresenter {
  FundManagementStateView view;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }
}
