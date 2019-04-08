import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';
import 'package:my_expenses/home/home_page.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_presenter.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_view.dart';

class NewExpenseCategoryPage extends StatefulWidget {
  NewExpenseCategoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _NewExpenseCategoryPageState();
}

class _NewExpenseCategoryPageState extends BasePageState<NewExpenseCategoryPage>
    implements NewExpenseCategoryStateView {
  NewExpenseCategoryStatePresenter presenter;

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
                      decoration: createTextFieldDecoration("EXPENSE CATEGORY NAME"),
                      validator: (String value) {
                        if (!presenter.isCategoryNameValid(value)) {
                          return ValidationMessagesConstants
                              .THIS_FIELD_CANT_BE_EMPTY;
                        }
                      },
                      onSaved: (String value) {
                        presenter.expenseName = value;
                      },
                    ),
                    createSizedBox(10.0),
                    new Checkbox(value: presenter.isBill, onChanged: presenter.onValueChanged),
                    createSizedBox(30.0),
                    createRaisedButton(() {
                      presenter.performAddNewIncomeCategoryName();
                    }, createText("ADD NEW EXPENSE CATEGORY", createButtonTextStyle())),
                  ])))
        ]));
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = new NewExpenseCategoryStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showInsertionFailure() {
    showMessage("INSERTION FAILED");
  }

  @override
  void showInsertionSuccess() {
    //todo mock id
    int id = 0;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage(id)),
            (Route<dynamic> route) => false);
  }
}
