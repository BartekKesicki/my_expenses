import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/income_category_database_helper.dart';
import 'package:my_expenses/db/helpers/income_database_helper.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/new_income_page/new_income_state_view.dart';

class NewIncomeStatePresenter extends BaseStatePresenter {

  NewIncomeStateView view;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Income model;
  IncomeDatabaseHelper helper;
  IncomeCategoryDatabaseHelper categoryHelper;
  String category;

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    helper = new IncomeDatabaseHelper();
    categoryHelper = IncomeCategoryDatabaseHelper();
  }

  @override
  void detach() {
    view = null;
  }

  void performToAddNewIncome() {
    //todo add income to db
  }

  void performToLoadCategories() {
    //todo load categories
  }
}