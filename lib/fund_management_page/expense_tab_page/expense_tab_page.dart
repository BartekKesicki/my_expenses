import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:grouped_listview/grouped_listview.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_view.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/group.dart';
import 'package:my_expenses/new_expense_page/new_expense_page.dart';

class ExpenseTabPage extends StatefulWidget {
  ExpenseTabPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExpenseTabPageState createState() => _ExpenseTabPageState();
}

class _ExpenseTabPageState extends BasePageState<ExpenseTabPage>
    implements ExpenseTabView {
  ExpenseTabPresenter presenter;
  Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return new Scaffold(
      body: mainWidget,
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
  void showExpensesListView(List<Group> expenses) {
    if (expenses != null && expenses.isNotEmpty) {
      setState(() {
        mainWidget = new Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new GroupedListView<Group, String>(
                collection: expenses,
                groupBy: (Group g) => g.groupName,
                listBuilder: (BuildContext context, Group g) =>
                    new ListTile(title: new Text(g.expense.name)),
                    groupBuilder: (BuildContext context, String name) => new Text(name),
              ),
//              new ListView.builder(
//                itemCount: expenses.length,
//                scrollDirection: Axis.vertical,
//                shrinkWrap: true,
//                itemBuilder: (context, position) {
//                  return Card(
//                    child: Padding(
//                      padding: const EdgeInsets.all(16.0),
//                      child: Text(
//                        expenses[position].name,
//                        style: TextStyle(fontSize: 22.0),
//                      ),
//                    ),
//                  );
//                },
//              ),
              //todo fill with sticky header list
              createRaisedButton(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewExpensePage()));
              }, createText("ADD EXPENSE", createButtonTextStyle()))
            ],
          ),
        );
      });
    } else {
      showNoExpensesView();
    }
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
