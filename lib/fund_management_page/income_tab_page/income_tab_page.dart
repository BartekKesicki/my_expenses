import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_view.dart';

class IncomeTabPage extends StatefulWidget {
  IncomeTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _IncomeTabPageState createState() => _IncomeTabPageState();
}

class _IncomeTabPageState extends BasePageState<IncomeTabPage>
    implements IncomeTabView {
  IncomeTabPresenter presenter;

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return new Scaffold(
      body: new Text("INCOMES"),
    );
  }

  @override
  void showMessage(String message) {}

  void initHomePresenter() {
    if (presenter == null) {
      presenter = IncomeTabPresenter();
      presenter.attach(this);
    }
  }
}
