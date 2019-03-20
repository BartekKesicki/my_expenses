import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_state_presenter.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_state_view.dart';

class NewIncomeCategoryPage extends StatefulWidget {
  NewIncomeCategoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _NewIncomeCategoryPageState();
}

class _NewIncomeCategoryPageState extends BasePageState<NewIncomeCategoryPage>
    implements NewIncomeCategoryStateView {

  NewIncomeCategoryStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      body: new Text("ADD NEW INCOME CATEGORY PAGE"),
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new NewIncomeCategoryStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }
}
