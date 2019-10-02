import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/home_page/home_page.dart';
import 'package:my_expenses/login/login_bloc.dart';
import 'package:my_expenses/register/register_personal_data_page.dart';

class LoginPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

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
                    TextField(
                      decoration: AppStyles.createTextFieldDecoration(AppStrings.email),
                      onChanged: (value) {
                        //todo invoke event
                      },
                    ),
                    TextField(
                      decoration: AppStyles.createTextFieldDecoration(AppStrings.password),
                      obscureText: true,
                      onChanged: (value) {
                        //todo invoke change event
                      },
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
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(
                                    AppDimens.appRaisedButtonCornerRadius)),
                            elevation: AppDimens.appRaisedButtonElevation,
                            color: Colors.green,
                            onPressed: () {
                              //todo invoke event
                            },
                            child: Center(
                                child: AppWidgets.createText(AppStrings.login,
                                    AppStyles.createButtonTextStyle())),
                          ),),
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
        .push(MaterialPageRoute(builder: (context) => RegisterPersonalDataPage()));
  }
}
