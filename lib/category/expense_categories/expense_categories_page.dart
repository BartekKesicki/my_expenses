import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/category/expense_categories/expense_categories_bloc.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/home_page/home_page_action.dart';

import 'expense_categories_event.dart';
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
  final _searchbarController = TextEditingController();
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
            if (expenseCategoriesState is InitialExpenseCategoriesPageState) {
              return _buildExpenseCategoriesListView(expenseCategoriesState.expenseCategories);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void _redirectToNewExpenseCategoryPage() {
    _homePageAction.redirectToNewExpenseCategoryPage();
  }

  Widget _buildExpenseCategoriesListView(List<ExpenseCategory> expenseCategories) {
    //todo create layout without expenses
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(flex: AppDimens.flexForSearchbar, child: _createSearchbar()),
          Expanded(
              flex: AppDimens.flexForListview,
              child: _createListView(expenseCategories)),
          Expanded(
              flex: AppDimens.flexForAddNewItemButton,
              child: _createAddNewIncomeCategoryButton())
        ],
      ),
    );
  }

  Widget _createSearchbar() {
    //todo change focused border color
    return Padding(
      padding: EdgeInsets.all(AppDimens.searchBarPadding),
      child: TextField(
        controller: _searchbarController,
        decoration:
        AppStyles.createSearchBarTextFieldDecoration(AppStrings.search),
      ),
    );
  }

  Widget _createListView(List<ExpenseCategory> expenseCategories) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expenseCategories.length,
        itemBuilder: (context, index) {
          return _createListTile(expenseCategories[index], index);
        });
  }

  Widget _createListTile(ExpenseCategory expenseCategory, int index) {
    return ListTile(
      title: AppWidgets.createText(
          expenseCategory.name, AppStyles.createSimpleLabelTextStyle()),
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

  Widget _createAddNewIncomeCategoryButton() {
    return AppWidgets.createAppButton(() {
      _expenseCategoriesBloc.dispatch(RedirectToNewExpenseCategoryEvent());
    },
        AppWidgets.createText(
            AppStrings.addIncomeCategory, AppStyles.createButtonTextStyle()));
  }
}