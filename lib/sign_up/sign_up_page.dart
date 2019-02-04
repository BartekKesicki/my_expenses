
import 'package:flutter/material.dart';
import 'package:my_expenses/sign_up/sign_up_state_presenter.dart';
import 'package:my_expenses/sign_up/sign_up_state_view.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> implements SignUpStateView {

  SignUpStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initSignUpPresenter();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: Text("REGISTER PAGE (WIP)")
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void initSignUpPresenter() {
    presenter = SignUpStatePresenter();
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
}