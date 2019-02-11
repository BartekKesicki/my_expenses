import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_page_data.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_state_presenter.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_state_view.dart';

class SignUpPersonalDataPage extends StatefulWidget {
  SignUpPersonalDataPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPersonalDataPageState createState() => _SignUpPersonalDataPageState();
}

class _SignUpPersonalDataPageState extends BasePageState<SignUpPersonalDataPage> implements SignUpPersonalDataStateView {

  SignUpPersonalDataStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initSignUpPresenter();
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                child: Stack(
                  children: <Widget>[
                    createTopLabelsContainer(createText("Sign up", createTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
                    createTopLabelsContainer(createText("Personal data", createSubTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 195.0, 0.0, 0.0)),
                  ],
            )
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Form(
                child:  Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: createTextFieldDecoration("EMAIL"),
                        onSaved: (String value) {

                        }
                     ),
                    createSizedBox(5.0),
                    TextFormField(
                        decoration: createTextFieldDecoration("PASSWORD"),
                        obscureText: true,
                        onSaved: (String value) {

                        }
                    ),
                    createSizedBox(5.0),
                    TextFormField(
                        decoration: createTextFieldDecoration("CONFIRM PASSWORD"),
                        obscureText: true,
                        onSaved: (String value) {

                        }
                    ),
                    createSizedBox(50.0),
                    createSubmitButton(() {
                      presenter.performToMoveToNextPage();
                      }, createText("NEXT", createButtonTextStyle()))
                  ],
                ),)
            )
          ],
        )
    );
  }

  void initSignUpPresenter() {
    presenter = SignUpPersonalDataStatePresenter();
    presenter.attach(this);
  }

  @override
  void redirectToLoginPage() {
    Navigator.pop(context);
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
  void redirectToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpExpenseDataPage()));
  }

  @override
  void dispose() {
    presenter.detach();
    super.dispose();
  }
}