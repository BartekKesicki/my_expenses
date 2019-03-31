import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/new_income_page/new_income_state_presenter.dart';
import 'package:my_expenses/new_income_page/new_income_state_view.dart';

class NewIncomePage extends StatefulWidget {
  NewIncomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewIncomePageState createState() => _NewIncomePageState();
}

class _NewIncomePageState extends BasePageState<NewIncomePage>
    implements NewIncomeStateView {
  NewIncomeStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    //todo fill the page form
    initPresenter();
    return new Scaffold(
      body: new Text("NEW INCOME"),
    );
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = NewIncomeStatePresenter();
      presenter.attach(this);
    }
  }
}