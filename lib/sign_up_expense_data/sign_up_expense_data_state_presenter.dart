import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_model.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';

class SignUpExpenseDataStatePresenter extends BaseStatePresenter {

  SignUpExpenseDataStateView view;
  SignUpExpenseModel model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dbHelper = DatabaseHelper();

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    model = new SignUpExpenseModel();
  }

  void validateInputsAndSignup(SignUpPersonalDataModel personalData) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      User user = createUser(personalData);
      dbHelper.saveUser(user);
      view.redirectToLoginPage();
    } else {
      view.autoValidate();
    }
  }

  User createUser(SignUpPersonalDataModel personalData) {
    //todo remove mocked id
   // int id = 0;
    return User(null, personalData.email, personalData.password, model.income, model.monthlyLimit, model.startFunds);
  }

  @override
  void detach() {
    view = null;
  }
}