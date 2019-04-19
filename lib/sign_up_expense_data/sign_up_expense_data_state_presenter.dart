import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_model.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';

class SignUpExpenseDataStatePresenter extends BaseStatePresenter {
  SignUpExpenseDataStateView view;
  SignUpExpenseModel model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dbHelper = UserDatabaseHelper();

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    model = new SignUpExpenseModel();
  }

  void validateInputsAndSignup(SignUpPersonalDataModel personalData) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      User user = createUser(personalData);
      await dbHelper.saveUser(user)
          .then((onValue) => view.redirectToLoginPage())
          .catchError((onError) => view.showMessage(onError.toString()));
    } else {
      view.autoValidate();
    }
  }

  User createUser(SignUpPersonalDataModel personalData) {
    return User(null, personalData.email, personalData.password, model.income,
        model.monthlyLimit, model.startFunds);
  }

  @override
  void detach() {
    view = null;
  }
}
