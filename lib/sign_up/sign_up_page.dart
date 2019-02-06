
import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/sign_up/sign_up_state_presenter.dart';
import 'package:my_expenses/sign_up/sign_up_state_view.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage> implements SignUpStateView {

  SignUpStatePresenter presenter;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    initSignUpPresenter();
    return Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child:
                  Column(
                    children: <Widget>[
                      createTopLabelsContainer(createText("Sign up", createTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
                      ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Column(
                            children: <Widget>[
                              IntrinsicHeight(
                                child: Container(
                                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                        decoration: createTextFieldDecoration("EMAIL"),
                                      ),
                                      createSizedBox(20.0),
                                      TextField(
                                        decoration: createTextFieldDecoration("PASSWORD"),
                                        obscureText: true,
                                      ),
                                      createSizedBox(20.0),
                                      TextField(
                                        decoration: createTextFieldDecoration("CONFIRM PASSWORD"),
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
              ),

            );
          },
        )
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}