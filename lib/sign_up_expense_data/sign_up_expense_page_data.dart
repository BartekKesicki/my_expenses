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
    return Scaffold(
        body: Column(
            children: <Widget>[
              Container(
                  child:
                  Stack(
                    children: <Widget>[
                      createTopLabelsContainer(createText("Sign up", createTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
                      createTopLabelsContainer(createText("Expenses data", createSubTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 195.0, 0.0, 0.0)),
                    ],
                  )
              ),
            ]
        )
    );
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
