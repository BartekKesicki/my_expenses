import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
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
          AppWidgets.createTopLabelsContainer(
              AppWidgets.createText(AppStrings.signup, AppStyles.createTitleTextStyle()),
              EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
          AppWidgets.createTopLabelsContainer(
              AppWidgets.createText(AppStrings.expensesData, AppStyles.createSubTitleTextStyle()),
              EdgeInsets.fromLTRB(15.0, 195.0, 0.0, 0.0)),
        ],
      )),
      Container(
        padding: EdgeInsets.only(top: AppDimens.containerTopMargin, left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
        child: Form(
          key: presenter.getFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: AppStyles.createTextFieldDecoration(AppStrings.startFunds),
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
              AppWidgets.createSizedBox(5.0),
              TextFormField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.yourIncome),
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
              AppWidgets.createSizedBox(5.0),
              TextFormField(
                  decoration:
                  AppStyles.createTextFieldDecoration(AppStrings.monthlyLimit),
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
              AppWidgets.createSizedBox(50.0),
              AppWidgets.createRaisedButton(() {
                personalData = widget.model;
                presenter.validateInputsAndSignup(personalData);
              }, AppWidgets.createText(AppStrings.signup, AppStyles.createButtonTextStyle()))
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
      content: new Text(AppStrings.somethingWentWrong),
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
