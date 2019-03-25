import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
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
      appBar: AppBar(backgroundColor: Colors.green, title: Text('Settings')),
      body: Center(
        child: createRaisedButton(() {
          showLogoutDialog();
        }, new Text("LOGOUT")),
      ),
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new SettingsStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Logout"),
          content: new Text("DO YOU WANT LOGOUT?"),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  redirectToLoginPage();
                },
                child: new Text("YES")),
            new FlatButton(onPressed: null, 
                child: new Text("NO"))
          ],
        );
      }
    );
  }

  void redirectToLoginPage() {

  }
}
