import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_view.dart';

class NewExpenseStatePresenter extends BaseStatePresenter {

  NewExpenseStateView view;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
  }

  @override
  void detach() {
    view = null;
  }
}