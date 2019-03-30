import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_category_database_helper.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_view.dart';

class NewExpenseCategoryStatePresenter extends BaseStatePresenter {

  NewExpenseCategoryStateView view;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ExpenseCategoryDatabaseHelper helper;

  get getFormKey => _formKey;
  String expenseName;
  bool isBill = false;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = new ExpenseCategoryDatabaseHelper();
  }

  @override
  void detach() {
    view = null;
  }

  void performAddNewIncomeCategoryName() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      return;
    }
    ExpenseCategory category = new ExpenseCategory(isBill ? 1 : 0, expenseName, false);
    await helper.saveExpenseCategory(category).then((onValue) => view.showInsertionSuccess()).catchError((onError) => view.showInsertionFailure());
  }

  bool isCategoryNameValid(String value) {
    return value != null && value.isNotEmpty;
  }

  void onValueChanged(bool value) {
    isBill = value;
  }
}