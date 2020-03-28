import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/category/income_categories/income_categories_bloc.dart';
import 'package:my_expenses/db/model/income_category.dart';
import 'package:my_expenses/home_page/home_page_action.dart';

import 'income_categories_state.dart';

class IncomeCategoriesPage extends StatefulWidget {

  IncomeCategoriesPage({Key key, this.title, this.homePageAction}) : super(key: key);

  final String title;
  final HomePageAction homePageAction;

  @override
  State<StatefulWidget> createState() => _IncomeCategoriesPageState();

}

class _IncomeCategoriesPageState extends State<IncomeCategoriesPage> {

  final _incomeCategoriesBloc = IncomeCategoriesPageBloc();
  final _searchbarController = TextEditingController();

  HomePageAction _homePageAction;

  @override
  Widget build(BuildContext context) {
    _homePageAction = widget.homePageAction;
    return BlocListener(
      bloc: _incomeCategoriesBloc,
      listener: (BuildContext context, IncomeCategoriesState incomeCategoriesState) {
        if (incomeCategoriesState is RedirectToNewIncomeCategoryPageState) {
          _redirectToNewIncomeCategoryPage();
        }
      },
      child: BlocProvider(
        builder: (BuildContext context) => _incomeCategoriesBloc,
        child: BlocBuilder(
          bloc: _incomeCategoriesBloc,
          builder: (BuildContext context, IncomeCategoriesState incomeCategoriesState) {
            if (incomeCategoriesState is InitialIncomeCategoriesPageState) {
              return _buildIncomeCategoriesListView(incomeCategoriesState.incomeCategories);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildIncomeCategoriesListView(List<IncomeCategory> incomeCategories) {
    //todo create layout without expenses
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(flex: AppDimens.flexForSearchbar, child: _createSearchbar()),
          Expanded(
              flex: AppDimens.flexForListview,
              child: _createListView(incomeCategories)),
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

  Widget _createListView(List<IncomeCategory> incomeCategories) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: incomeCategories.length,
        itemBuilder: (context, index) {
          return _createListTile(incomeCategories[index], index);
        });
  }

  Widget _createListTile(IncomeCategory incomeCategory, int index) {
    return ListTile(
      title: AppWidgets.createText(
          incomeCategory.name, AppStyles.createSimpleLabelTextStyle()),
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
      //todo redirect to new income category form
    },
        AppWidgets.createText(
            AppStrings.addIncomeCategory, AppStyles.createButtonTextStyle()));
  }

  void _redirectToNewIncomeCategoryPage() {
    _homePageAction.redirectToNewIncomeCategoryPage();
  }

}