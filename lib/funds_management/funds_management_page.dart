import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/funds_management/funds_management_bloc.dart';
import 'package:my_expenses/funds_management/funds_management_state.dart';

class FundsManagementPage extends StatefulWidget {

  FundsManagementPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _FundsManagementPageState();

}

class _FundsManagementPageState extends State<FundsManagementPage> with SingleTickerProviderStateMixin {

  final _fundsManagementBloc = FundsManagementPageBloc();
  final TABS_LENGTH = 2;
  final INCOMES_TAB_LENGTH = 0;
  final EXPENSES_TAB_LENGTH = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS_LENGTH,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          bottom: TabBar(
            onTap: (index) => _performEvent(index),
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
                //todo fill with other states
                return Container();
              }
          ),
        ),
      ),
    );
  }

  void _performEvent(int index) {
    //todo launch events
  }
}