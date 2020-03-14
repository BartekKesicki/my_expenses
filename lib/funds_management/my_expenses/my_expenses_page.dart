import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/funds_management/my_expenses/my_expenses_bloc.dart';
import 'package:my_expenses/funds_management/my_expenses/my_expenses_state.dart';
import 'package:my_expenses/home_page/home_page_action.dart';

class MyExpensesPage extends StatefulWidget {
  MyExpensesPage({Key key, this.title, this.homePageAction}) : super(key: key);

  final HomePageAction homePageAction;
  final String title;

  @override
  State<StatefulWidget> createState() => _MyExpensesPageState();
}

class _MyExpensesPageState extends State<MyExpensesPage> {
  final _myExpenseBloc = MyExpensesPageBloc();
  final _expensesSearchBarControllerText = TextEditingController();
  HomePageAction _homePageAction;

  @override
  Widget build(BuildContext context) {
    _homePageAction = widget.homePageAction;
    return BlocListener(
      bloc: _myExpenseBloc,
      listener:
          (BuildContext context, MyExpensesPageState myExpensesPageState) {
        if (myExpensesPageState is RedirectToNewExpensePageState) {
          redirectToNewExpensePage();
        }
      },
      child: BlocProvider(
        builder: (BuildContext context) => _myExpenseBloc,
        child: BlocBuilder(
            bloc: _myExpenseBloc,
            builder: (BuildContext context,
                MyExpensesPageState myExpensesPageState) {
              if (myExpensesPageState is InitialMyExpensesPageState) {
                // myExpensesPageState.expenses.addAll(_buildExpenses());
                return _buildMyExpensesListView(myExpensesPageState.expenses);
              } else {
                return Container();
              }
              //todo fill with other states
            }),
      ),
    );
  }

  Widget _buildMyExpensesListView(List<Expense> expenses) {
    //todo create layout without expenses
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(flex: AppDimens.flexForSearchbar, child: _createSearchbar()),
          Expanded(
              flex: AppDimens.flexForListview,
              child: _createListView(expenses)),
          Expanded(
              flex: AppDimens.flexForAddNewItemButton,
              child: _createAddNewExpenseButton())
        ],
      ),
    );
  }

  Widget _createSearchbar() {
    //todo change focused border color
    return Padding(
      padding: EdgeInsets.all(AppDimens.searchBarPadding),
      child: TextField(
        controller: _expensesSearchBarControllerText,
        decoration:
            AppStyles.createSearchBarTextFieldDecoration(AppStrings.search),
      ),
    );
  }

  Widget _createListView(List<Expense> expenses) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return _createListTile(expenses[index], index);
        });
  }

  Widget _createListTile(Expense expense, int index) {
    return ListTile(
      title: AppWidgets.createText(
          expense.name, AppStyles.createSimpleLabelTextStyle()),
      subtitle: AppWidgets.createText(
          expense.price.toString(), AppStyles.createSimpleDataTextStyle()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            onPressed: () {
              //todo handle edit
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              //todo handle delete
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void redirectToNewExpensePage() {
    _homePageAction.redirectToNewExpensePage();
  }

  Widget _createAddNewExpenseButton() {
    return AppWidgets.createAppButton(() {
      //todo redirect to new expense form
    },
        AppWidgets.createText(
            AppStrings.addExpense, AppStyles.createButtonTextStyle()));
  }

  //todo remove method
  List<Expense> _buildExpenses() {
    List<Expense> expenses = List();
    Expense expense1 = Expense(0, "expense1", 1, 20.0, 34985934579345);
    Expense expense2 = Expense(0, "expense2", 1, 25.0, 34985934579345);
    Expense expense3 = Expense(0, "expense3", 1, 26.0, 34985934579345);
    Expense expense4 = Expense(0, "expense4", 1, 27.0, 34985934579345);
    expenses.add(expense1);
    expenses.add(expense2);
    expenses.add(expense3);
    expenses.add(expense4);
    return expenses;
  }
}
