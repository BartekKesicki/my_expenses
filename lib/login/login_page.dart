import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {

  @override
  Widget build(BuildContext context) {
    //todo create new login form with BLoC pattern
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(child: createHeader()),
          Container(
            padding: EdgeInsets.only(left: AppDimens.loginContainerSideMargin, right: AppDimens.loginContainerSideMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.email),
//                  onSaved: (String value) {
//                    //todo fill login model
//                  },
                ),
                TextField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.password),
                  obscureText: true,
//                  onSaved: (String value) {
//                    //todo fill login model
//                  },
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: AppDimens.loginLowerContainerTopMargin, left: AppDimens.loginContainerSideMargin, bottom: AppDimens.loginBottomContainerMargin),
                  child: InkWell(
                      child: AppWidgets.createText(
                          AppStrings.forgotPassword, AppStyles.createHyperLinkTextStyle())),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppDimens.loginTopContainerTopMargin, bottom: AppDimens.loginBottomContainerMargin),
                  child: AppWidgets.createRaisedButton(() {
                    //todo invoke perform login in bloc
                  }, AppWidgets.createText(AppStrings.login, AppStyles.createButtonTextStyle())),
                ),
                createSignUpButton(),
              ],
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createHeader() {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.loginContainerSideMargin, right:  AppDimens.loginContainerSideMargin),
      child: new Column(
          children: <Widget>[
        //todo column with specific spacing
        Container(
          width : MediaQuery.of(context).size.width,
          child: AppWidgets.createText(AppStrings.my, AppStyles.createTitleTextStyle()),
        ),
        Container(
          width : MediaQuery.of(context).size.width,
          child: AppWidgets.createText(AppStrings.expensesLowerCase, AppStyles.createTitleTextStyle()),
        ),
      ]),
    );
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
            //todo redirect to signup page
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

  void redirectToHomePage() {
    //todo redirect to home page
  }

  void redirectToSignUpPage() {
    //todo redirect to sign up page
  }
}
