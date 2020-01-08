import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/home_page/home_page.dart';
import 'package:my_expenses/login/login_bloc.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_page.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {

  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
            child: BlocListener(
              bloc: loginBloc,
              listener: (BuildContext context, LoginState state) {
                if (state is BackButtonState) {
                  //do nothing
                } else if (state is RedirectToRegisterPageState) {
                  redirectToSignUpPage(context);
                } else if (state is LoginResponseState && state.response) {
                  redirectToHomePage(context);
                }
              },
              child: BlocProvider(
                builder: (BuildContext context) => loginBloc,
                child: BlocBuilder(
                    bloc: loginBloc,
                    builder: (BuildContext context, LoginState loginState) {
                      if (loginState is InitialLoginState) {
                        return buildMainLoginWidget(context, loginState.usernameErrorMessage, loginState.passwordErrorMessage);
                      } else if (loginState is LoginInProgressState) {
                        return buildLoginInProgressSate(context);
                      }  else if (loginState is LoginResponseState && !loginState.response) {
                        return buildMainLoginWidget(context, loginState.responseMessage, null);
                      }
                      return Container();
                    }),
              )
            )
            ),
      ),
    );
  }

  Column buildMainLoginWidget(BuildContext context, String userErrorMessage, String passwordErrorMessage) {
    return Column(
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
                      decoration: AppStyles.createTextFieldDecoration(AppStrings.email, userErrorMessage),
                      controller: _userTextController,
                      onChanged: (value) {
                        final loginBloc = BlocProvider.of<LoginBloc>(context);
                        loginBloc.dispatch(ValidateLoginEvent(_userTextController.text, _passwordTextController.text));
                      },
                    ),
                    TextField(
                      decoration: AppStyles.createTextFieldDecoration(AppStrings.password, passwordErrorMessage),
                      controller: _passwordTextController,
                      obscureText: true,
                      onChanged: (value) {
                        final loginBloc = BlocProvider.of<LoginBloc>(context);
                        loginBloc.dispatch(ValidateLoginEvent(_userTextController.text, _passwordTextController.text));
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
                              loginBloc.dispatch(SubmitLoginEvent(_userTextController.text, _passwordTextController.text));
                            },
                            child: Center(
                                child: AppWidgets.createText(AppStrings.login,
                                    AppStyles.createButtonTextStyle())),
                          ),),
                    ),
                    createSignUpButton(context),
                  ]))
        ]);
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
            loginBloc.dispatch(RedirectToRegisterPageEvent());
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

  Widget buildLoginInProgressSate(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(),
            Text(AppStrings.processingData)
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    loginBloc.dispatch(BackButtonEvent());
    return false;
  }
}
