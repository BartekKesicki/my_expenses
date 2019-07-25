import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';
import 'package:my_expenses/home/home_page.dart';
import 'package:my_expenses/login/login_state_presenter.dart';
import 'package:my_expenses/login/login_state_view.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_page_personal_data_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage>
    implements LoginStateView {
  LoginStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initLoginPresenter();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(child: createHeader()),
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Form(
              key: presenter.getFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: createTextFieldDecoration("EMAIL"),
                    validator: (String value) {
                      if (!presenter.emailIsValid(value)) {
                        return ValidationMessagesConstants.INCORRECT_EMAIL;
                      }
                      presenter.model.email = value;
                    },
                    onSaved: (String value) {
                      presenter.model.email = value;
                    },
                  ),
                  TextFormField(
                    decoration: createTextFieldDecoration("PASSWORD"),
                    validator: (String value) {
                      if (!presenter.passwordIsValid(value)) {
                        return ValidationMessagesConstants
                            .THIS_FIELD_CANT_BE_EMPTY;
                      }
                    },
                    obscureText: true,
                    onSaved: (String value) {
                      presenter.model.password = value;
                    },
                  ),
                  createSizedBox(5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: InkWell(
                        child: createText(
                            "Forgot Password", createHyperLinkTextStyle())),
                  ),
                  createSizedBox(30.0),
                  createRaisedButton(() {
                    presenter.performLogin();
                  }, createText("LOGIN", createButtonTextStyle())),
                  createSizedBox(20.0),
                  createSignUpButton(),
                ],
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void initLoginPresenter() {
    if (presenter == null) {
      presenter = LoginStatePresenter();
      presenter.attach(this);
    }
  }

  Stack createHeader() {
    return new Stack(children: <Widget>[
      createTopLabelsContainer(createText("My", createTitleTextStyle()),
          EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
      createTopLabelsContainer(createText("Expenses", createTitleTextStyle()),
          EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0))
    ]);
  }

  Container createSignUpButton() {
    return new Container(
      height: 50.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1.0),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: GestureDetector(
          onTap: () {
            presenter.performToLaunchSignUpPage();
          },
          child: Center(
              child: createText(
                  "SIGN UP",
                  TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Montserrat"))),
        ),
      ),
    );
  }

  @override
  void redirectToHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }

  @override
  void redirectToSignUpPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SignUpPersonalDataPage()));
  }

  @override
  void autoValidate() {
    setState(() {
      presenter.model.setAutoValidate(true);
    });
  }
}
