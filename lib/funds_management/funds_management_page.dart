import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/funds_management/funds_management_bloc.dart';
import 'package:my_expenses/funds_management/funds_management_state.dart';
import 'package:my_expenses/funds_management/my_expenses/my_expenses_page.dart';
import 'package:my_expenses/funds_management/my_incomes/my_incomes_page.dart';
import 'package:my_expenses/home_page/home_page_action.dart';

import 'funds_management_event.dart';

class FundsManagementPage extends StatefulWidget {

  FundsManagementPage({Key key, this.title, this.homePageAction}) : super(key: key);

  final HomePageAction homePageAction;
  final String title;

  @override
  State<StatefulWidget> createState() => _FundsManagementPageState();

}

class _FundsManagementPageState extends State<FundsManagementPage> with SingleTickerProviderStateMixin {

  HomePageAction _homePageAction;

  final _fundsManagementBloc = FundsManagementPageBloc();
  final TABS_LENGTH = 2;
  final INCOMES_TAB_INDEX = 0;
  final EXPENSES_TAB_INDEX = 1;

  @override
  Widget build(BuildContext context) {
    _homePageAction = widget.homePageAction;
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
                text: AppStrings.incomes,
              ),
              Tab(
                text: AppStrings.expenses,
              )
            ],
          ),
        ),
        body: BlocProvider(
          builder: (BuildContext context) => _fundsManagementBloc,
          child: BlocBuilder(
              bloc: _fundsManagementBloc,
              builder : (BuildContext context, FundsManagementPageState fundsManagementPageState) {
                if (fundsManagementPageState is FundsManagementSwitchToMyIncomesState) {
                  return MyIncomesPage(homePageAction: _homePageAction,);
                } else if (fundsManagementPageState is FundsManagementSwitchToMyExpensesState) {
                  return MyExpensesPage(homePageAction: _homePageAction,);
                } else {
                  return MyIncomesPage(homePageAction: _homePageAction,);
                }
              }
          ),
        ),
      ),
    );
  }

  void _performEvent(int index) {
    if (index == INCOMES_TAB_INDEX) {
      _fundsManagementBloc.dispatch(SwitchMyIncomesPageEvent());
    } else if (index == EXPENSES_TAB_INDEX) {
      _fundsManagementBloc.dispatch(SwitchMyExpensesPageEvent());
    }
  }
}