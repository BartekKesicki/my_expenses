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
  List<ExpenseCategory> categories;
  bool categoryExists = false;
  String dropDownCategory;

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
                categoryExists
                    ? DropdownButton(
                        onChanged: onChangedDropDownItem,
                        hint: Text('Please choose category'),
                        items: categories.map((category) {
                          return DropdownMenuItem(
                            child: new Text(category.name),
                            value: category.name,
                          );
                        }).toList(),
                      )
                    : TextFormField(
                        decoration: createTextFieldDecoration("NEW CATEGORY"),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (!NewExpenseValidator.isExpenseCategoryValid(
                              value)) {
                            return "INCORRECT CATEGORY";
                          }
                        },
                        onSaved: (String value) {
                          presenter.category = value;
                        },
                      ),
                createRaisedButton(() {
                  presenter.performAddExpense();
                }, createText("SUBMIT BUTTON", createButtonTextStyle())),
              ])))
    ]));
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
      categoryExists = true;
      categories = list;
      dropDownCategory = list[0].name;
    });
  }

  void onChangedDropDownItem(String newValue) {
    setState(() {
      presenter.category = newValue;
      dropDownCategory = newValue;
    });
  }

  @override
  void buildTextFieldForNewCategory() {
    setState(() {
      categoryExists = false;
    });
  }

  @override
  void onExpenseInserted() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }
}
