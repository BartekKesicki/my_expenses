import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/register/register_personal_data_bloc.dart';
import 'package:my_expenses/register/register_personal_data_event.dart';
import 'package:my_expenses/register/register_personal_data_state.dart';

class RegisterPersonalDataPage extends StatelessWidget {

  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final registerBloc = RegisterPersonalDataBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => registerBloc,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: BlocBuilder(
                bloc: registerBloc,
                  builder : (BuildContext context, RegisterPersonalDataState registerPersonalDataState) {
                  //todo return other widgets
                    return buildMainRegisterForm(context, registerPersonalDataState);
              })
          ),
        ),
      ),
    );
  }

  Column buildMainRegisterForm(BuildContext context, InitialRegisterPersonalDataState initialRegisterPersonalDataState) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AppWidgets.createTopLabelsContainer(AppWidgets.createText(AppStrings.personalData, AppStyles.createTitleTextStyle()), EdgeInsets.all(AppDimens.containerSideMargin)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                      child: TextField(
                        controller: _userTextController,
                        decoration: AppStyles.createTextFieldDecoration(AppStrings.login, initialRegisterPersonalDataState.usernameErrorMessage),
                        onChanged: (value) {
                          final registerBloc = BlocProvider.of<RegisterPersonalDataBloc>(context);
                          registerBloc.dispatch(ValidateRegisterPersonalDataEvent(_userTextController.text, _passwordTextController.text, _confirmPasswordTextController.text));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                      child: TextField(
                        controller: _passwordTextController,
                        decoration: AppStyles.createTextFieldDecoration(AppStrings.password, initialRegisterPersonalDataState.passwordErrorMessage),
                        obscureText: true,
                        onChanged: (value) {
                          final registerBloc = BlocProvider.of<RegisterPersonalDataBloc>(context);
                          registerBloc.dispatch(ValidateRegisterPersonalDataEvent(_userTextController.text, _passwordTextController.text, _confirmPasswordTextController.text));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                      child: TextField(
                        controller: _confirmPasswordTextController,
                        decoration: AppStyles.createTextFieldDecoration(AppStrings.confirmPassword, initialRegisterPersonalDataState.confirmPasswordErrorMessage),
                        obscureText: true,
                        onChanged: (value) {
                          final registerBloc = BlocProvider.of<RegisterPersonalDataBloc>(context);
                          registerBloc.dispatch(ValidateRegisterPersonalDataEvent(_userTextController.text, _passwordTextController.text, _confirmPasswordTextController.text));
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin, top: AppDimens.containerTopMargin),
                  child: AppWidgets.createSubmitButton(() {
                    //todo submit button
                  }, AppWidgets.createText(AppStrings.next, AppStyles.createButtonTextStyle()))
                )
              ],
            );
  }
}