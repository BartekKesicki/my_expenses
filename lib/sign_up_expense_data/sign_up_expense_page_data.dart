import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_presenter.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';

class SignUpExpenseDataPage extends StatefulWidget {
  SignUpExpenseDataPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpExpenseDataPageState createState() => _SignUpExpenseDataPageState();
}

class _SignUpExpenseDataPageState extends BasePageState<SignUpExpenseDataPage> implements SignUpExpenseDataStateView {

  SignUpExpenseDataStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initSignUpPresenter();
    return Scaffold();
  }

  void initSignUpPresenter() {
    presenter = SignUpExpenseDataStatePresenter();
    presenter.attach(this);
  }

  @override
  void redirectToLoginPage() {
    // TODO: implement redirectToLoginPage
  }

  @override
  void showError() {
    // TODO: implement showError
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  @override
  void signUpUser() {
    // TODO: implement signUpUser
  }

  @override
  void dispose() {
    presenter.detach();
    super.dispose();
  }

}
