import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/category/categories_bloc.dart';
import 'package:my_expenses/category/categories_event.dart';

import 'categories_state.dart';

class CategoriesPage extends StatefulWidget {

  CategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _CategoriesPageState();

}

class _CategoriesPageState extends State<CategoriesPage> {

  final _categoriesBloc = CategoriesPageBloc();
  final TABS_LENGTH = 2;
  final INCOME_CATEGORIES_TAB_INDEX = 0;
  final EXPENSE_CATEGORIES_TAB_INDEX = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS_LENGTH,
      child: Scaffold(
        appBar: AppBar(
          //todo change height of bar
          backgroundColor: Colors.green,
          bottom: TabBar(
            onTap: (index) => _performEvent(index),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: AppStrings.incomeCategories,
              ),
              Tab(
                text: AppStrings.expenseCategories,
              )
            ],
          ),
        ),
        body: BlocProvider(
          builder: (BuildContext context) => _categoriesBloc,
          child: BlocBuilder(
              bloc: _categoriesBloc,
              builder : (BuildContext context, CategoriesState categoriesState) {
                //todo handle switching pages
                if (categoriesState is RedirectToIncomeCategoriesState) {
                  return Container();
                } else if (categoriesState is RedirectToExpenseCategoriesState) {
                  return Container();
                } else {
                  return Container();
                }
              }
          ),
        ),
      ),
    );
  }

  void _performEvent(int index) {
    if (index == INCOME_CATEGORIES_TAB_INDEX) {
      _categoriesBloc.dispatch(RedirectToIncomeCategoriesEvent());
    } else if (index == EXPENSE_CATEGORIES_TAB_INDEX) {
      _categoriesBloc.dispatch(RedirectToExpenseCategoriesEvent());
    }
  }

}

