import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_view.dart';
import 'package:my_expenses/new_expense_page/new_expense_page.dart';
import 'package:my_expenses/utils/date_calculator.dart';

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
  Widget closeButton = new Container();
  var searchBarWidth = 100.0;
  TextEditingController editingController = TextEditingController();
  List<Expense> expenses = new List();
  FocusNode myFocusNode = FocusNode();

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
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new AnimatedContainer(
                      duration: new Duration(milliseconds: 300),
                      width: searchBarWidth,
                      child: new Container(
                        child: new Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                          child: new TextField(
                            focusNode: myFocusNode,
                            onTap: () => expandSearchBar(),
                            onChanged: (String value) {
                              if (value != null) {
                                presenter.loadExpensesByName(value);
                              }
                            },
                            controller: editingController,
                            decoration: InputDecoration(
                                labelText: "Search",
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0)))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  closeButton,
                  new Expanded(
                      child: new Align(
                          alignment: Alignment.centerRight,
                          child: new Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: new IconButton(
                                icon: new Icon(Icons.filter_list),
                                onPressed: () => {}),
                          )))
                ],
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: expenses.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return ExpansionTile(
                      title: Text(
                        expenses[position].name,
                        style: TextStyle(fontSize: 22.0),
                      ),
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                child: new Text("Created: " + DateCalculator.buildDateTime(expenses[position].timestamp)),
                              ),
                              new Row(
                                children: <Widget>[
                                  new IconButton(
                                    color: Colors.white,
                                    onPressed: () => {
                                      //todo edit income
                                    },
                                    icon: new Icon(Icons.edit, color: Colors.green) ,
                                  ),
                                  new IconButton(
                                    color: Colors.white,
                                    onPressed: () => {
                                      //todo delete income
                                    },
                                    icon: new Icon(Icons.delete, color: Colors.green) ,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
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

  void expandSearchBar() {
    setState(() {
      searchBarWidth = 250.0;
      closeButton = new IconButton(
          icon: new Icon(Icons.close), onPressed: () => closeSearchBar());
    });
  }

  void closeSearchBar() {
    setState(() {
      searchBarWidth = 100.0;
      closeButton = new Container();
      editingController.clear();
      myFocusNode.unfocus();
    });
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
