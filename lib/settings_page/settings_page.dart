import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/login/login_page.dart';
import 'package:my_expenses/settings_page/settings_state_presenter.dart';
import 'package:my_expenses/settings_page/settings_state_view.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends BasePageState<SettingsPage>
    implements SettingsStateView {
  SettingsStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text(AppStrings.settingsPage)),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: createRaisedButton(() {
            showLogoutDialog();
          }, createText(AppStrings.logout, createButtonTextStyle())),
        ),
      )
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new SettingsStatePresenter();
      presenter.attach(this);
    }
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(AppStrings.logout),
          content: new Text(AppStrings.doYouWantLogout),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  redirectToLoginPage();
                },
                child: new Text(AppStrings.yes)),
            new FlatButton(
                onPressed: () {},
                child: new Text(AppStrings.no))
          ],
        );
      }
    );
  }

  void redirectToLoginPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
  }
}
