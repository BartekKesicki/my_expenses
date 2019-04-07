import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/home/home_page.dart';
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
  Widget categoryPartialFormWidget;

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
                    categoryPartialFormWidget,
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
      presenter.performToLoadCategories();
    }
  }

  @override
  void buildExpenseCategoriesDropDownList(List<ExpenseCategory> list) {
    setState(() {
      categoryPartialFormWidget = DropdownButton(
        hint: Text('Please choose a location'),
        onChanged: (newValue) {
          setState(() {
            presenter.category = newValue;
          });
        },
        items: list.map((location) {
          return DropdownMenuItem(
            child: new Text(location.name),
            value: location,
          );
        }).toList(),
      );
    });
  }

  @override
  void buildTextFieldForNewCategory() {
    setState(() {
      categoryPartialFormWidget = TextFormField(
        decoration: createTextFieldDecoration("NEW CATEGORY"),
        keyboardType: TextInputType.number,
        validator: (String value) {
          if(!NewExpenseValidator.isExpenseCategoryValid(value)) {
            return "INCORRECT CATEGORY";
          }
        },
        onSaved: (String value) {
          presenter.category  = value;
        },
      );
    });
  }

  @override
  void onExpenseInserted() {
    //todo mocked id change later
    int id = 0;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage(id)),
            (Route<dynamic> route) => false);
  }
}