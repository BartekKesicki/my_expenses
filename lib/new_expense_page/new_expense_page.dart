import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_presenter.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_view.dart';

class NewExpensePage extends StatefulWidget {
  NewExpensePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewExpensePageState createState() => _NewExpensePageState();
}

class _NewExpensePageState extends BasePageState<NewExpensePage>
    implements NewExpenseStateView {
  NewExpenseStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    //todo fill the page form
    initPresenter();
    return new Scaffold(
      body: new Text("NEW EXPENSE"),
    );
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = NewExpenseStatePresenter();
      presenter.attach(this);
    }
  }
}