import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_presenter.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_view.dart';

class NewExpenseCategoryPage extends StatefulWidget {
  NewExpenseCategoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _NewExpenseCategoryPageState();
}

class _NewExpenseCategoryPageState extends BasePageState<NewExpenseCategoryPage>
    implements NewExpenseCategoryStateView {
  NewExpenseCategoryStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
        body: new Text("NEW EXPENSE CATEGORY PAGE")
    );
  }

  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new NewExpenseCategoryStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }
}
