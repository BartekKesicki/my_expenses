import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/my_profile_page/profile_state_presenter.dart';
import 'package:my_expenses/my_profile_page/profile_state_view.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage>
    implements ProfileStateView {
  ProfileStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('My Profile')),
      body: Center(
        child: Text("PROFILE"),
      ),
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new ProfileStatePresenter();
      presenter.attach(this);
    }
  }
}
