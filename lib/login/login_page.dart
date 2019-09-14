import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/home_page/home_page.dart';
import 'package:my_expenses/login/login_bloc.dart';
import 'package:my_expenses/register/register_personal_data.dart';

class LoginPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();

    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              createHeader(context),
          Container(
              padding: EdgeInsets.only(
                  left: AppDimens.loginContainerSideMargin,
                  right: AppDimens.loginContainerSideMargin),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StreamBuilder<String>(
                      stream: bloc.email,
                      builder: (context, snapshot) => TextField(
                        decoration: AppStyles.createTextFieldDecoration(
                            AppStrings.email, snapshot.error),
                        onChanged: bloc.emailChanged,
                      ),
                    ),
                    StreamBuilder<String>(
                      stream: bloc.password,
                      builder: (context, snapshot) => TextField(
                        decoration: AppStyles.createTextFieldDecoration(
                            AppStrings.password, snapshot.error),
                        obscureText: true,
                        onChanged: bloc.passwordChanged,
                      ),
                    ),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(
                          top: AppDimens.loginLowerContainerTopMargin,
                          left: AppDimens.loginContainerSideMargin,
                          bottom: AppDimens.loginBottomContainerMargin),
                      child: InkWell(
                          child: AppWidgets.createText(
                              AppStrings.forgotPassword,
                              AppStyles.createHyperLinkTextStyle())),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppDimens.loginTopContainerTopMargin,
                          bottom: AppDimens.loginBottomContainerMargin),
                      child: Container(
                          height: AppDimens.appRaisedButtonHeight,
                          child: StreamBuilder<bool>(
                            stream: bloc.submitCheck,
                            builder: (BuildContext context, AsyncSnapshot snapshot) => RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(
                                      AppDimens.appRaisedButtonCornerRadius)),
                              elevation: AppDimens.appRaisedButtonElevation,
                              color: Colors.green,
                              onPressed: () {
                                if (snapshot.hasData) {
                                    redirectToHomePage(context);
                                }
                              },
                              child: Center(
                                  child: AppWidgets.createText(AppStrings.login,
                                      AppStyles.createButtonTextStyle())),
                            ),
                          )),
                    ),
                    createSignUpButton(context),
                  ]))
        ]));
  }

  Widget createHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppDimens.loginContainerSideMargin,
          right: AppDimens.loginContainerSideMargin),
      child: new Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: AppWidgets.createText(
              AppStrings.my, AppStyles.createTitleTextStyle()),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: AppWidgets.createText(
              AppStrings.expensesLowerCase, AppStyles.createTitleTextStyle()),
        ),
      ]),
    );
  }

  Container createSignUpButton(BuildContext context) {
    return new Container(
      height: AppDimens.loginSignUpButtonHeight,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: AppDimens.loginSignUpBorderButtonWidth),
          color: Colors.transparent,
          borderRadius:
              BorderRadius.circular(AppDimens.loginButtonBorderRadius),
        ),
        child: GestureDetector(
          onTap: () {
            redirectToSignUpPage(context);
          },
          child: Center(
              child: AppWidgets.createText(
                  AppStrings.signup,
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.montserratFont))),
        ),
      ),
    );
  }

  redirectToHomePage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  redirectToSignUpPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPersonalData()));
  }
}
