import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/category/expense_categories/expense_categories_bloc.dart';

import 'expense_categories_state.dart';

class ExpenseCategoriesPage extends StatefulWidget {

  ExpenseCategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _ExpenseCategoriesPageState();

}

class _ExpenseCategoriesPageState extends State<ExpenseCategoriesPage> {

  final _expenseCategoriesBloc = ExpenseCategoriesPageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _expenseCategoriesBloc,
      listener: (BuildContext context, ExpenseCategoriesState expenseCategoriesState) {
        //todo handle to redirect to new category
      },
      child: BlocProvider(
        builder: (BuildContext context) => _expenseCategoriesBloc,
        child: BlocBuilder(
          bloc: _expenseCategoriesBloc,
          builder: (BuildContext context, ExpenseCategoriesState expenseCategoriesState) {
            //todo build listview
            return Container();
          },
        ),
      ),
    );
  }
}