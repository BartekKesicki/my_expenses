import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_listed_page_state.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_view.dart';
import 'package:my_expenses/new_expense_page/new_expense_page.dart';

class ExpenseTabPage extends StatefulWidget {
  ExpenseTabPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExpenseTabPageState createState() => _ExpenseTabPageState();
}

class _ExpenseTabPageState extends BaseListedPageState<ExpenseTabPage>
    implements ExpenseTabView {
  ExpenseTabPresenter presenter;
  Widget mainWidget;
  List<Expense> expenses = new List();

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return expenses.isEmpty
        ? createNoContentWidget("No expenses", "ADD FIRST EXPENSE", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewExpensePage()));
          })
        : new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  createSearchBarContent((String value) {
                    if (value != null) {
                      presenter.loadExpensesByName(value);
                    }
                  }),
                  closeButton,
                  createFilterListButton()
                ],
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: expenses.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return createListItemTile(expenses[position].name, () {
                      showListItemDialog(context, "EDIT", "DO YOU WANT EDIT THIS ITEM?", () {
                        //todo redirect to edit item
                      });
                    }, () {
                      showListItemDialog(context, "DELETE", "DO YOU WANT DELETE THIS ITEM?", () {
                        //todo delete item
                      });
                    }, expenses[position].timestamp);
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
                          builder: (context) => NewExpensePage()));
                }, createText("ADD EXPENSE", createButtonTextStyle())),
              )
            ],
          );
  }

  void initHomePresenter() {
    if (presenter == null) {
      presenter = ExpenseTabPresenter();
      presenter.attach(this);
      presenter.loadExpensesList();
    }
  }

  @override
  void updateExpensesList(List<Expense> expenses) {
    setState(() {
      if (expenses != null) {
        this.expenses = expenses;
      }
    });
  }

  @override
  void showNoExpensesView() {
    setState(() {
      mainWidget =
          createNoContentWidget("No expenses", "ADD FIRST EXPENSE", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewExpensePage()));
      });
    });
  }
}
