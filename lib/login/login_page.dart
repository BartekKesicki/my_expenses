import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/login/login_state_presenter.dart';
import 'package:my_expenses/login/login_state_view.dart';

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
    //todo create new login form with BLoC pattern
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(child: createHeader()),
          Container(
            padding: EdgeInsets.only(top: AppDimens.loginTopContainerTopMargin, left: AppDimens.loginContainerSideMargin, right: AppDimens.loginContainerSideMargin),
            child: Form(
              key: presenter.getFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: AppStyles.createTextFieldDecoration(AppStrings.email),
                    onSaved: (String value) {
                      presenter.model.email = value;
                    },
                  ),
                  TextFormField(
                    decoration: AppStyles.createTextFieldDecoration(AppStrings.password),
                    obscureText: true,
                    onSaved: (String value) {
                      presenter.model.password = value;
                    },
                  ),
                  AppWidgets.createSizedBox(5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: AppDimens.loginLowerContainerTopMargin, left: AppDimens.loginContainerSideMargin),
                    child: InkWell(
                        child: AppWidgets.createText(
                            AppStrings.forgotPassword, AppStyles.createHyperLinkTextStyle())),
                  ),
                  AppWidgets.createSizedBox(30.0),
                  AppWidgets.createRaisedButton(() {
                    presenter.performLogin();
                  }, AppWidgets.createText(AppStrings.login, AppStyles.createButtonTextStyle())),
                  AppWidgets.createSizedBox(20.0),
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
      //todo column with specific spacing
      AppWidgets.createTopLabelsContainer(AppWidgets.createText(AppStrings.my, AppStyles.createTitleTextStyle()),
          EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
      AppWidgets.createTopLabelsContainer(AppWidgets.createText(AppStrings.expensesLowerCase, AppStyles.createTitleTextStyle()),
          EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0))
    ]);
  }

  Container createSignUpButton() {
    return new Container(
      height: AppDimens.loginSignUpButtonHeight,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: AppDimens.loginSignUpBorderButtonWidth),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimens.loginButtonBorderRadius),
        ),
        child: GestureDetector(
          onTap: () {
            presenter.performToLaunchSignUpPage();
          },
          child: Center(
              child: AppWidgets.createText(
                  AppStrings.signup,
                  TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: AppStrings.montserratFont))),
        ),
      ),
    );
  }

  @override
  void redirectToHomePage() {
    //todo redirect to home page
  }

  @override
  void redirectToSignUpPage() {
    //todo redirect to sign up page
  }

  @override
  void autoValidate() {
    setState(() {
      presenter.model.setAutoValidate(true);
    });
  }
}
