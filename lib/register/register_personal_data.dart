import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/register/register_personal_data_bloc.dart';

class RegisterPersonalData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = RegisterPersonalDataBloc();
    //todo fill bloc with streambuilder
    return Scaffold(
      body: Container(
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
                        decoration: AppStyles.createTextFieldDecoration(
                            AppStrings.login, null),
                        onChanged: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                      child: TextField(
                        decoration: AppStyles.createTextFieldDecoration(
                            AppStrings.password, null),
                        obscureText: true,
                        onChanged: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
                      child: TextField(
                        decoration: AppStyles.createTextFieldDecoration(
                            AppStrings.confirmPassword, null),
                        obscureText: true,
                        onChanged: null,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin, top: AppDimens.containerTopMargin),
                  child: AppWidgets.createSubmitButton(null, AppWidgets.createText(AppStrings.next, AppStyles.createButtonTextStyle()))
                )
              ],
            )
        ),
      ),
    );
  }
}