import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/fund_management_page/fund_management_state_presenter.dart';
import 'package:my_expenses/fund_management_page/fund_management_state_view.dart';

class FundManagementPage extends StatefulWidget {

  FundManagementPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _FundManagementState();

}

class _FundManagementState extends BasePageState<FundManagementPage> implements FundManagementStateView {

  FundManagementStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      body: Center(
        child: Text("FUND MANAGEMENT"),
      ),
    );
  }
  //todo fill the page tab view

  void initPresenter() {
    if (presenter == null) {
      presenter = new FundManagementStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

}