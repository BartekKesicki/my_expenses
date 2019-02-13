import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_presenter.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_state_view.dart';
import 'package:my_expenses/sign_up_expense_data/sign_up_expense_data_validator.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';

class SignUpExpenseDataPage extends StatefulWidget {
  SignUpExpenseDataPage(SignUpPersonalDataModel model, {Key key, this.title}) : super(key: key);

  final String title;
  SignUpPersonalDataModel model;

  @override
  _SignUpExpenseDataPageState createState() => _SignUpExpenseDataPageState();
}

class _SignUpExpenseDataPageState extends BasePageState<SignUpExpenseDataPage> implements SignUpExpenseDataStateView {

  SignUpExpenseDataStatePresenter presenter;
  SignUpExpenseDataValidator validator;
  SignUpPersonalDataModel personalData;

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
                child: Form(
                    key: presenter.getFormKey,
                    autovalidate: presenter.model.getAutoValidate ,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: createTextFieldDecoration("START FUNDS"),
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            validator.validateNumberInput(value);
                          },
                          onSaved: (String value) {
                              presenter.model.startFunds = value;
                          },
                        ),
                        createSizedBox(5.0),
                        TextFormField(
                            decoration: createTextFieldDecoration("YOUR INCOME"),
                            keyboardType: TextInputType.number,
                            validator: (String value) {
                              validator.validateNumberInput(value);
                            },
                            onSaved: (String value) {
                                presenter.model.income = value;
                            }
                        ),
                        createSizedBox(5.0),
                        TextFormField(
                            decoration: createTextFieldDecoration("MONTHLY LIMIT (OPTIONAL)"),
                            keyboardType: TextInputType.number,
                            validator: (String value) {
                              validator.validateMonthlyLimit(value);
                            },
                            onSaved: (String value) {
                                presenter.model.monthlyLimit = value;
                            }
                        ),
                        createSizedBox(50.0),
                        createSubmitButton(() {
                          personalData = widget.model;
                          presenter.validateInputsAndSignup(personalData);
                        }, createText("SIGN UP", createButtonTextStyle()))
                      ],
                    ),
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

  @override
  void autoValidate() {
    setState(() {
      presenter.model.setAutoValidate(true);
    });
  }

}
