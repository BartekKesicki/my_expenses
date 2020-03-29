import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/category/expense_categories/expense_categories_bloc.dart';
import 'package:my_expenses/home_page/home_page_action.dart';

import 'expense_categories_state.dart';

class ExpenseCategoriesPage extends StatefulWidget {

  ExpenseCategoriesPage({Key key, this.title, this.homePageAction}) : super(key: key);

  final String title;
  final HomePageAction homePageAction;

  @override
  State<StatefulWidget> createState() => _ExpenseCategoriesPageState();

}

class _ExpenseCategoriesPageState extends State<ExpenseCategoriesPage> {

  final _expenseCategoriesBloc = ExpenseCategoriesPageBloc();
  HomePageAction _homePageAction;

  @override
  Widget build(BuildContext context) {
    _homePageAction = widget.homePageAction;
    return BlocListener(
      bloc: _expenseCategoriesBloc,
      listener: (BuildContext context, ExpenseCategoriesState expenseCategoriesState) {
        if (expenseCategoriesState is RedirectToNewExpenseCategoryPageState) {
          _redirectToNewExpenseCategoryPage();
        }
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

  void _redirectToNewExpenseCategoryPage() {
    _homePageAction.redirectToNewExpenseCategoryPage();
  }
}