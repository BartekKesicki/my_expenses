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
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: createTextFieldDecoration("START FUNDS"),
                    ),
                    createSizedBox(5.0),
                    TextField(
                      decoration: createTextFieldDecoration("YOUR INCOME"),
                    ),
                    createSizedBox(5.0),
                    TextField(
                      decoration: createTextFieldDecoration("MONTHLY LIMIT (OPTIONAL)"),
                    ),
                    createSizedBox(50.0),
                    createSubmitButton(() {
                      //todo perform to login page without previous screens on stack
                    }, createText("SIGN UP", createButtonTextStyle()))
                  ],
                ),
              )
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
