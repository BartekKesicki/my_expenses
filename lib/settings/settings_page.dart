import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/login/login_page.dart';
import 'package:my_expenses/settings/settings_bloc.dart';
import 'package:my_expenses/settings/settings_event.dart';
import 'package:my_expenses/settings/settings_state.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final _settingsBloc = SettingsPageBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        builder: (BuildContext context) => _settingsBloc,
        child: BlocBuilder(
            bloc: _settingsBloc,
            builder: (BuildContext context, SettingsState settingsState) {
              if (settingsState is LogoutPageState) {
                _redirectToLoginPage(context);
                return Container();
              }
              return _buildMainSettingsWidget();
            }),
      ),
    );
  }

  _redirectToLoginPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

  Widget _buildMainSettingsWidget() {
    return Center(
      child: AppWidgets.createSubmitButton(() {
        showAlertDialog();
      }, AppWidgets.createText(
          AppStrings.logout, AppStyles.createButtonTextStyle())),
    );
  }

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppWidgets.createAlertDialog(context,
              AppStrings.doYouWantLogout, AppStrings.yes, AppStrings.no, () {
            //todo interface to home page
//                Navigator.pop(context);
//              _settingsBloc.dispatch(PerformLogoutEvent());
          }, () {
            Navigator.pop(context);
              });
        });
  }
}