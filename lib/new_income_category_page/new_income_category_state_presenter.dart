import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/income_category_database_helper.dart';
import 'package:my_expenses/db/model/income_category.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_state_view.dart';

class NewIncomeCategoryStatePresenter extends BaseStatePresenter {
  NewIncomeCategoryStateView view;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String incomeName;
  IncomeCategoryDatabaseHelper helper;

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = new IncomeCategoryDatabaseHelper();
  }

  @override
  void detach() {
    this.view = null;
    helper = null;
  }

  void performAddNewIncomeCategoryName() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      return;
    }
    IncomeCategory incomeCategory = new IncomeCategory(null, incomeName);
    await helper.saveIncome(incomeCategory).then((onValue) => view.insertionSucceed()).catchError((onError) => view.insertionFailed());
  }

  bool isCategoryNameValid(String value) {
    return value != null && value.isNotEmpty;
  }
}