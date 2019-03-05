

import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/expenses_page/expenses_state_presenter.dart';
import 'package:my_expenses/expenses_page/expenses_state_view.dart';

class ExpensesPage extends StatefulWidget {

  ExpensesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _ExpensesPageState();

}

class _ExpensesPageState extends BasePageState<ExpensesPage> implements ExpensesStateView {

  ExpensesStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      body: Center(
        child: Text("EXPENSES"),
      ),
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new ExpensesStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

}