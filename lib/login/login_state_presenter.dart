import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/login/login_model.dart';
import 'package:my_expenses/login/login_state_view.dart';
import 'package:my_expenses/login/login_validator.dart';

class LoginStatePresenter extends BaseStatePresenter {

  LoginStateView view;
  LoginModel model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dbHelper = DatabaseHelper();

  get getFormKey => _formKey;

  void performLogin(String login, String password) async {
    var userExists = await dbHelper.checkIfUserExists(login, password);
    if (_formKey.currentState.validate() && !userExists) {
      _formKey.currentState.save();
      //todo redirect to home page
    } else {
      view.autoValidate();
    }
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
  }

  @override
  void detach() {
    view = null;
  }
}