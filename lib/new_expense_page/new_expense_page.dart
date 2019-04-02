import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_presenter.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_view.dart';
import 'package:my_expenses/new_expense_page/new_expense_validator.dart';

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
    initPresenter();
    return new Scaffold(
        body: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Form(
                  key: presenter.getFormKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      decoration: createTextFieldDecoration("EXPENSE NAME"),
                      validator: (String value) {
                        if (!NewExpenseValidator.isExpenseNameValid(value)) {
                          return "INCORRECT EXPENSE NAME";
                        }
                      },
                      onSaved: (String value) {
                        presenter.model.name = value;
                      },
                    ),
                    TextFormField(
                      decoration: createTextFieldDecoration("AMOUNT"),
                      validator: (String value) {
                        if (!NewExpenseValidator.isExpenseAmountValid(value)) {
                          return "INCORRECT EXPENSE AMOUNT";
                        }
                      },
                      onSaved: (String value) {
                        presenter.model.price = double.parse(value);
                      },
                    ),
                    //todo add dropdown list
                    createRaisedButton(() {
                      presenter.performAddExpense();
                    }, createText("SUBMIT BUTTON", createButtonTextStyle())),
                  ])))
        ]));
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