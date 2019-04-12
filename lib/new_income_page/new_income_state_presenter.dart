import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/income_category_database_helper.dart';
import 'package:my_expenses/db/helpers/income_database_helper.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/db/model/income_category.dart';
import 'package:my_expenses/new_income_page/income_form_model.dart';
import 'package:my_expenses/new_income_page/new_income_state_view.dart';

class NewIncomeStatePresenter extends BaseStatePresenter {

  NewIncomeStateView view;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  IncomeFormModel incomeFormModel;
  IncomeDatabaseHelper helper;
  IncomeCategoryDatabaseHelper categoryHelper;
  String category;

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    incomeFormModel = new IncomeFormModel();
    helper = new IncomeDatabaseHelper();
    categoryHelper = IncomeCategoryDatabaseHelper();
  }

  @override
  void detach() {
    view = null;
  }

  void performToAddNewIncome() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      return;
    }
    await categoryHelper.getCategoryId(category)
        .then((onValue) => continueInsertionNewIncome(onValue))
        .catchError((onError) => insertNewIncomeCategory());
  }

  void continueInsertionNewIncome(int onValue) async {
    Income income = new Income(null, incomeFormModel.amount, incomeFormModel.name, onValue, new DateTime.now().millisecondsSinceEpoch);
    await helper.saveIncome(income)
        .then((onValue) => view.onIncomeInserted())
        .catchError((onError) => view.showMessage("INSERTION FAILED"));
  }

  void insertNewIncomeCategory() async {
    IncomeCategory incomeCategory = IncomeCategory(null, category);
    categoryHelper.saveIncomeCategory(incomeCategory)
        .then((onValue) => continueInsertionNewIncome(onValue))
        .catchError((onError) => view.showMessage("CATEGORY INSERTION FAILED"));
  }

  void performToLoadCategories() async {
    await categoryHelper.getAllIncomeCategories()
        .then((result) => onIncomeCategoriesFetched(result))
        .catchError(onIncomeCategoryFetchError);
  }

  void onIncomeCategoriesFetched(List<IncomeCategory> result) {
    if (result != null && result.isNotEmpty) {
      view.buildIncomeCategoriesDropDownList(result);
    } else {
      view.buildTextFieldForNewCategory();
    }
  }

  void onIncomeCategoryFetchError() {
    view.showMessage("CAN'T LOAD INCOME CATEGORIES");
  }
}