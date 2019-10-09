import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/register/register_personal_data_bloc.dart';

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
              child: Column(
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
                          decoration: AppStyles.createTextFieldDecoration(AppStrings.login),
                          onChanged: (value) {
                            //todo invoke on change event
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                        child: TextField(
                          controller: _passwordTextController,
                          decoration: AppStyles.createTextFieldDecoration(AppStrings.password),
                          obscureText: true,
                          onChanged: (value) {
                            //todo invoke on change event
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                        child: TextField(
                          controller: _confirmPasswordTextController,
                          decoration: AppStyles.createTextFieldDecoration(AppStrings.confirmPassword),
                          obscureText: true,
                          onChanged: (value) {
                            //todo invoke onchange event
                          },
                        ),
                      ),
                    ],
                  ),
                  //todo submit form
                  Padding(
                    padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin, top: AppDimens.containerTopMargin),
                    child: AppWidgets.createSubmitButton(() {
                      //todo submit button
                    }, AppWidgets.createText(AppStrings.next, AppStyles.createButtonTextStyle()))
                  )
                ],
              )
          ),
        ),
      ),
    );
  }

  submitForm() {

  }
}