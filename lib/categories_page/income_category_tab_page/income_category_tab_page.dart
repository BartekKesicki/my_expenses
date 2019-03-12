import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_state_presenter.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_view.dart';

class IncomeCategoryTabPage extends StatefulWidget {
  IncomeCategoryTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _IncomeCategoryTabPageState createState() => _IncomeCategoryTabPageState();
}

class _IncomeCategoryTabPageState extends BasePageState<IncomeCategoryTabPage>
    implements IncomeCategoryTabStateView {
  IncomeCategoryTabStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initIncomeCategoryTabPresenter();
    return new Scaffold(
      body: new Text("INCOMES CATEGORIES"),
    );
  }

  @override
  void showMessage(String message) {}

  void initIncomeCategoryTabPresenter() {
    if (presenter == null) {
      presenter = IncomeCategoryTabStatePresenter();
      presenter.attach(this);
    }
  }
}