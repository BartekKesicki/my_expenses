import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_model.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';

class SignUpExpenseDataStatePresenter extends BaseStatePresenter {

  SignUpExpenseDataStateView view;
  SignUpExpenseModel model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    model = new SignUpExpenseModel();
  }

  void validateInputsAndSignup(SignUpPersonalDataModel personalData) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //todo sign up data
    } else {
      view.autoValidate();
    }
  }

  @override
  void detach() {
    view = null;
  }
}