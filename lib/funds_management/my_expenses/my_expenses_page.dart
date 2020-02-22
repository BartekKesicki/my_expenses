import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                return _buildMyIncomesListView(myExpensesPageState.expenses);
              } else {
                return Container();
              }

              //todo fill with other states
            }
        ),
      ),
    );
  }

  Widget _buildMyIncomesListView(List<Expense> expenses) {
    //todo create listview
    return Container();
  }

  void redirectToNewExpensePage() {
    _homePageAction.redirectToNewExpensePage();
  }

}