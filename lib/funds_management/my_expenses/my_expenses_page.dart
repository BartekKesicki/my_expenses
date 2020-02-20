import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/funds_management/my_expenses/my_expenses_bloc.dart';
import 'package:my_expenses/funds_management/my_expenses/my_expenses_state.dart';

class MyExpensesPage extends StatefulWidget {

  MyExpensesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MyExpensesPageState();

}

class _MyExpensesPageState extends State<MyExpensesPage> {

  final _myExpenseBloc = MyExpensesPageBloc();

  @override
  Widget build(BuildContext context) {
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
    //todo redirect to new expense page
  }

}