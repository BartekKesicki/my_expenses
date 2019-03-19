import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/fund_management_page/outcome_tab_page/expense_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/outcome_tab_page/expense_tab_view.dart';

class ExpenseTabPage extends StatefulWidget {
  ExpenseTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
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

  @override
  void showMessage(String message) {}

  void initHomePresenter() {
    if (presenter == null) {
      presenter = ExpenseTabPresenter();
      presenter.attach(this);
      presenter.loadExpensesList();
    }
  }

  @override
  void showExpensesListView(List<Expense> expenses) {
    if (expenses != null && expenses.isNotEmpty) {
      setState(() {
        mainWidget = new Text("THERE IS SOME NEW EXPENSES");
        //todo init expenses list
      });
    } else {
      showNoExpensesView();
    }
  }

  @override
  void showNoExpensesView() {
   setState(() {
     mainWidget = createNoContentWidget("THERE IS NO EXPENSES", "ADD NEW EXPENSE", () {
       //todo redirect to new expense page
     });
   });
  }
}
