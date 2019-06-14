import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';
import 'package:my_expenses/login/login_page.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_presenter.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_validator.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';

class SignUpExpenseDataPage extends StatefulWidget {
  SignUpExpenseDataPage(this.model, {Key key, this.title}) : super(key: key);

  final String title;
  SignUpPersonalDataModel model;

  @override
  _SignUpExpenseDataPageState createState() => _SignUpExpenseDataPageState();
}

class _SignUpExpenseDataPageState extends BasePageState<SignUpExpenseDataPage>
    implements SignUpExpenseDataStateView {
  SignUpExpenseDataStatePresenter presenter;
  SignUpPersonalDataModel personalData;

  @override
  Widget build(BuildContext context) {
    initSignUpPresenter();
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          child: Stack(
        children: <Widget>[
          createTopLabelsContainer(
              createText("Sign up", createTitleTextStyle()),
              EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
          createTopLabelsContainer(
              createText("Expenses data", createSubTitleTextStyle()),
              EdgeInsets.fromLTRB(15.0, 195.0, 0.0, 0.0)),
        ],
      )),
      Container(
        padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Form(
          key: presenter.getFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: createTextFieldDecoration("START FUNDS"),
                keyboardType: TextInputType.number,
                validator: (String value) {
                  if (SignUpExpenseDataValidator.numberIsEmpty(value)) {
                    return ValidationMessagesConstants.THIS_FIELD_CANT_BE_EMPTY;
                  }
                },
                onSaved: (String value) {
                  presenter.model.startFunds = double.parse(value);
                },
              ),
              createSizedBox(5.0),
              TextFormField(
                  decoration: createTextFieldDecoration("YOUR INCOME"),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (SignUpExpenseDataValidator.numberIsEmpty(value)) {
                      return ValidationMessagesConstants
                          .THIS_FIELD_CANT_BE_EMPTY;
                    }
                    if (!SignUpExpenseDataValidator.numberIsNotBelowZero(
                        value)) {
                      return ValidationMessagesConstants
                          .VALUE_CANT_BE_BELOW_ZERO;
                    }
                  },
                  onSaved: (String value) {
                    presenter.model.income = double.parse(value);
                  }),
              createSizedBox(5.0),
              TextFormField(
                  decoration:
                      createTextFieldDecoration("MONTHLY LIMIT (OPTIONAL)"),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (!SignUpExpenseDataValidator.numberIsNotBelowZero(
                        value)) {
                      return ValidationMessagesConstants
                          .VALUE_CANT_BE_BELOW_ZERO;
                    }
                  },
                  onSaved: (String value) {
                    presenter.model.monthlyLimit = double.parse(value);
                  }),
              createSizedBox(50.0),
              createRaisedButton(() {
                personalData = widget.model;
                presenter.validateInputsAndSignup(personalData);
              }, createText("SIGN UP", createButtonTextStyle()))
            ],
          ),
        ),
      )
    ]));
  }

  void initSignUpPresenter() {
    if (presenter == null) {
      presenter = SignUpExpenseDataStatePresenter();
      presenter.attach(this);
      presenter.initDB();
    }
  }

  @override
  void redirectToLoginPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  @override
  void showError() {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("SOMETHING GOES WRONG"),
    ));
  }

  @override
  void dispose() {
    presenter.detach();
    super.dispose();
  }

  @override
  void autoValidate() {
    setState(() {
      presenter.model.setAutoValidate(true);
    });
  }
}
