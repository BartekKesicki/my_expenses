import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/fund_management_page/outcome_tab_page/outcome_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/outcome_tab_page/outcome_tab_view.dart';

class OutcomeTabPage extends StatefulWidget {
  OutcomeTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _OutcomeTabPageState createState() => _OutcomeTabPageState();
}

class _OutcomeTabPageState extends BasePageState<OutcomeTabPage>
    implements OutcomeTabView {
  OutcomeTabPresenter presenter;

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return new Scaffold(
      body: new Text("OUTCOMES"),
    );
  }

  @override
  void showMessage(String message) {}

  void initHomePresenter() {
    if (presenter == null) {
      presenter = OutcomeTabPresenter();
      presenter.attach(this);
    }
  }
}
