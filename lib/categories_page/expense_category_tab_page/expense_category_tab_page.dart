import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_presenter.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_view.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_page.dart';

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

  void initExpenseCategoryTabPresenter() {
    if (presenter == null) {
      presenter = ExpenseCategoryTabStatePresenter();
      presenter.attach(this);
      presenter.loadExpensesCategories();
    }
  }

  @override
  void showExpensesCategoriesView(List<ExpenseCategory> categories) {
    if (categories != null && categories.isNotEmpty) {
      setState(() {
        mainWidget = new Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          categories[position].name,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    );
                  },
                ),
                createRaisedButton(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewExpenseCategoryPage()));
                }, createText("ADD EXPENSE CATEGORY", createButtonTextStyle()))
              ],
            ));
      });
    } else {
      showNoExpenseCategoriesView();
    }
  }

  @override
  void showNoExpenseCategoriesView() {
    setState(() {
      mainWidget = createNoContentWidget(
          "No expense Categories", "ADD FIRST EXPENSE CATEGORY", () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewExpenseCategoryPage()));
      });
    });
  }
}
