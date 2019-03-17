import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_presenter.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_view.dart';
import 'package:my_expenses/db/model/expense_category.dart';

class ExpenseCategoryTabPage extends StatefulWidget {
  ExpenseCategoryTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _ExpenseCategoryTabPageState createState() => _ExpenseCategoryTabPageState();
}

class _ExpenseCategoryTabPageState extends BasePageState<ExpenseCategoryTabPage>
    implements ExpenseCategoryTabStateView {
  ExpenseCategoryTabStatePresenter presenter;
  Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    initExpenseCategoryTabPresenter();
    return new Scaffold(
      body: mainWidget,
    );
  }

  @override
  void showMessage(String message) {}

  void initExpenseCategoryTabPresenter() {
    if (presenter == null) {
      presenter = ExpenseCategoryTabStatePresenter();
      presenter.attach(this);
      presenter.loadExpensesCategories();
    }
  }

  @override
  void showExpensesCategoriesView(List<ExpenseCategory> categories) {
    if (categories.isEmpty) {
      showNoExpenseCategoriesView();
    } else {
      mainWidget = new Text("THERE IS SOME NEW CATEGORIES");
    }
  }

  @override
  void showNoExpenseCategoriesView() {
    mainWidget = new Text("THERE IS NO NEW CATEGORIES");
  }
}