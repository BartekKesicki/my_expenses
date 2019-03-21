import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_state_view.dart';

class NewIncomeCategoryStatePresenter extends BaseStatePresenter {
  NewIncomeCategoryStateView view;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String incomeName;

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    this.view = null;
  }

  void performAddNewIncomeCategoryName() {
    //todo check form
  }
}