import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_category_database_helper.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_view.dart';

class NewExpenseStatePresenter extends BaseStatePresenter {

  NewExpenseStateView view;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Expense model;
  ExpenseDatabaseHelper helper;
  ExpenseCategoryDatabaseHelper categoryHelper;
  String category;

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = new ExpenseDatabaseHelper();
    categoryHelper = new ExpenseCategoryDatabaseHelper();
  }

  @override
  void detach() {
    view = null;
  }

  void performAddExpense() {
    //todo add new expense
  }

  void performToLoadCategories() {
    //todo load categories
  }
}