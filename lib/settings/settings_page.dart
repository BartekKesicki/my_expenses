import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppWidgets.createSubmitButton(() {
        showAlertDialog();
      },
          AppWidgets.createText(
              AppStrings.logout, AppStyles.createButtonTextStyle())),
    );
  }

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppWidgets.createAlertDialog(context,
              AppStrings.doYouWantLogout, AppStrings.yes, AppStrings.no, () {
            //todo perform logout
          }, null);
        });
  }
}