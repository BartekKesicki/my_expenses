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
      listener: (BuildContext context, MyExpensesPageState myExpensesPageState) {
        if (myExpensesPageState is RedirectToNewExpensePageState) {
          redirectToNewExpensePage();
        }
      },
      child: BlocProvider(
        builder: (BuildContext context) => _myExpenseBloc,
        child: BlocBuilder(
            bloc: _myExpenseBloc,
            builder : (BuildContext context, MyExpensesPageState myExpensesPageState) {
              if (myExpensesPageState is InitialMyExpensesPageState) {
                return _buildMyExpensesListView(myExpensesPageState.expenses);
              } else {
                return Container();
              }

              //todo fill with other states
            }
        ),
      ),
    );
  }

  Widget _buildMyExpensesListView(List<Expense> expenses) {
    return Container(
      //todo create layout without expenses
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _createSearchbar(),
          _createListView(expenses),
          _createAddNewExpenseButton()
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
        decoration: AppStyles.createSearchBarTextFieldDecoration(AppStrings.search),
      ),
    );
  }

  Widget _createListView(List<Expense> expenses) {
    //todo create listviewbuilder
    return Container();
  }

  void redirectToNewExpensePage() {
    _homePageAction.redirectToNewExpensePage();
  }

  Widget _createAddNewExpenseButton() {
    return AppWidgets.createAppButton(() {
      //todo redirect to new expense form
    }, AppWidgets.createText(AppStrings.addExpense, AppStyles.createButtonTextStyle()));
  }
}