import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/expense_category_database_helper.dart';
import 'package:my_expenses/db/helpers/expense_database_helper.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/new_expense_page/expense_form_model.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_view.dart';

class NewExpenseStatePresenter extends BaseStatePresenter {

  NewExpenseStateView view;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ExpenseFormModel expenseFormModel;
  ExpenseDatabaseHelper helper;
  ExpenseCategoryDatabaseHelper categoryHelper;
  String category;

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    expenseFormModel = new ExpenseFormModel();
    helper = new ExpenseDatabaseHelper();
    categoryHelper = new ExpenseCategoryDatabaseHelper();
  }

  @override
  void detach() {
    view = null;
  }

  void performAddExpense() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      return;
    }
    await categoryHelper.getCategoryId(category)
        .then((value) => continueInsertingExpense(value))
        .catchError(insertCategoryFirst);
  }

  void continueInsertingExpense(int value) async {
    Expense expense = new Expense(null, expenseFormModel.name, value, expenseFormModel.price, new DateTime.now().millisecondsSinceEpoch);
    await helper.saveExpense(expense)
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
    if (categories != null && categories.isNotEmpty) {
      view.buildExpenseCategoriesDropDownList(categories);
    } else {
      view.buildTextFieldForNewCategory();
    }
  }

  void onFetchError() {
    view.showMessage("CAN'T LOAD CATEGORIES");
  }
}