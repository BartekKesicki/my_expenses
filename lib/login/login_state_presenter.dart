import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
import 'package:my_expenses/login/login_model.dart';
import 'package:my_expenses/login/login_state_view.dart';
import 'package:my_expenses/login/login_validator.dart';

class LoginStatePresenter extends BaseStatePresenter {
  LoginStateView view;
  LoginModel model = new LoginModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dbHelper;

  get getFormKey => _formKey;

  void performLogin() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      view.autoValidate();
      return;
    }
    await dbHelper
        .getUserIdOrNull(model.getEmail, model.getPassword)
        .then(login, onError: loginError);
  }

  void login(int value) {
    view.redirectToHomePage(value);
  }

  void loginError() {
    view.showMessage("LOGIN FAILED");
  }

  bool emailIsValid(String email) {
    return LoginValidator.emailIsValid(email);
  }

  bool passwordIsValid(String password) {
    return !LoginValidator.fieldIsEmpty(password);
  }

  void performToLaunchSignUpPage() {
    view.redirectToSignUpPage();
  }

  @override
  void attach(BaseStateView view) {
    this.view = view;
    dbHelper = UserDatabaseHelper();
  }

  @override
  void detach() {
    view = null;
  }
}
