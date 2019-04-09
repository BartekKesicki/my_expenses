import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_category_database_helper.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/db/model/expense_category.dart';
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

  void performAddExpense() async {
    await categoryHelper.getCategoryId(category)
        .then((value) => continueInsertingExpense(value))
        .catchError(insertCategoryFirst);
  }

  void continueInsertingExpense(int value) async {
    model.categoryId = value;
    model.timestamp = new DateTime.now().millisecondsSinceEpoch;
    await helper.saveExpense(model)
        .then((onValue) => view.onExpenseInserted())
        .catchError((onError) => view.showMessage("INSERTION FAILED"));
  }

  void insertCategoryFirst() {
    ExpenseCategory expenseCategory = new ExpenseCategory(null, category, false);
    categoryHelper.saveExpenseCategory(expenseCategory)
        .then((insertedCategoryId) => continueInsertingExpense(insertedCategoryId))
        .catchError((error) => view.showMessage("INSERTION CATEGORY FAILED"));
  }

  void performToLoadCategories() async{
    await categoryHelper.getAllExpenseCategories()
        .then((result) => onCategoriesFetched(result))
        .catchError(onFetchError);
  }

  void onCategoriesFetched(List<ExpenseCategory> categories) {
    if (categories.isNotEmpty) {
       view.buildTextFieldForNewCategory();
    } else {
      view.buildExpenseCategoriesDropDownList(categories);
    }
  }

  void onFetchError() {
    view.showMessage("SOMETHING GOES WRONG");
  }
}