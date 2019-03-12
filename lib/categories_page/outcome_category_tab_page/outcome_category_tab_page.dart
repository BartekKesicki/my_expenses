import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/outcome_category_tab_page/outcome_category_tab_state_presenter.dart';
import 'package:my_expenses/categories_page/outcome_category_tab_page/outcome_category_tab_state_view.dart';

class OutcomeCategoryTabPage extends StatefulWidget {
  OutcomeCategoryTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _OutcomeCategoryTabPageState createState() => _OutcomeCategoryTabPageState();
}

class _OutcomeCategoryTabPageState extends BasePageState<OutcomeCategoryTabPage>
    implements OutcomeCategoryTabStateView {
  OutcomeCategoryTabStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initOutcomeCategoryTabPresenter();
    return new Scaffold(
      body: new Text("INCOMES CATEGORIES"),
    );
  }

  @override
  void showMessage(String message) {}

  void initOutcomeCategoryTabPresenter() {
    if (presenter == null) {
      presenter = OutcomeCategoryTabStatePresenter();
      presenter.attach(this);
    }
  }
}