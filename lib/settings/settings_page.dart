import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/home_page/home_page_action.dart';
import 'package:my_expenses/settings/settings_bloc.dart';
import 'package:my_expenses/settings/settings_event.dart';
import 'package:my_expenses/settings/settings_state.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.homePageAction}) : super(key: key);

  final HomePageAction homePageAction;

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final _settingsBloc = SettingsPageBloc();

  HomePageAction _homePageAction;

  @override
  Widget build(BuildContext context) {
    _homePageAction = widget.homePageAction;
    return Container(
      child: BlocListener(
        bloc: _settingsBloc,
        listener: (BuildContext context, SettingsState settingsState) {
          if (settingsState is LogoutPageState) {
            _redirectToLoginPage(context);
          }
        },
        child: BlocProvider(
          builder: (BuildContext context) => _settingsBloc,
          child: BlocBuilder(
              bloc: _settingsBloc,
              builder: (BuildContext context, SettingsState settingsState) {
                if (settingsState is InitialSettingsPageState){
                  return _buildMainSettingsWidget(context);
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }

  _redirectToLoginPage(BuildContext context) {
    _homePageAction.onLogout();
  }

  Widget _buildMainSettingsWidget(BuildContext context) {
    return Center(
      child: AppWidgets.createAppButton(() {
        showAlertDialog(context);
      }, AppWidgets.createText(
          AppStrings.logout, AppStyles.createButtonTextStyle())),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppWidgets.createAlertDialog(context,
              AppStrings.doYouWantLogout, AppStrings.yes, AppStrings.no, () {
                Navigator.pop(context);
                _settingsBloc.dispatch(PerformLogoutEvent());
          }, () {
            Navigator.pop(context);
              });
        });
  }
}