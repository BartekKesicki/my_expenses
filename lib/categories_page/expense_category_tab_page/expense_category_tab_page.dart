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
  List<ExpenseCategory> expenseCategories = new List();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initExpenseCategoryTabPresenter();
    return expenseCategories.isEmpty
        ? createNoContentWidget(
            "No expense Categories", "ADD FIRST EXPENSE CATEGORY", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewExpenseCategoryPage()));
          })
        : new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: new TextField(
                  onChanged: (String value) {
                    //todo listener
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: expenseCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          expenseCategories[position].name,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: createRaisedButton(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewExpenseCategoryPage()));
                }, createText("ADD EXPENSE CATEGORY", createButtonTextStyle())),
              )
            ],
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
  void updateExpensesCategoriesList(List<ExpenseCategory> categories) {
    setState(() {
      this.expenseCategories = categories;
    });
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
