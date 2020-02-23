import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/funds_management/my_incomes/my_incomes_bloc.dart';
import 'package:my_expenses/funds_management/my_incomes/my_incomes_state.dart';
import 'package:my_expenses/home_page/home_page_action.dart';

class MyIncomesPage extends StatefulWidget {

  MyIncomesPage({Key key, this.title, this.homePageAction}) : super(key: key);

  final String title;
  final HomePageAction homePageAction;

  @override
  State<StatefulWidget> createState() => _MyIncomesPageState();

}

class _MyIncomesPageState extends State<MyIncomesPage> {

  final _myIncomesBloc = MyIncomesPageBloc();
  HomePageAction _homePageAction;

  @override
  Widget build(BuildContext context) {
    _homePageAction = widget.homePageAction;
    return BlocListener(
      bloc: _myIncomesBloc,
      listener: (BuildContext context, MyIncomesPageState myIncomesPageState) {
        if (myIncomesPageState is RedirectToNewIncomePageState) {
          _redirectToNewIncomePage();
        }
      },
      child: BlocProvider(
        builder: (BuildContext context) => _myIncomesBloc,
        child: BlocBuilder(
            bloc: _myIncomesBloc,
            builder : (BuildContext context, MyIncomesPageState myIncomesPageState) {
              if (myIncomesPageState is InitialMyIncomesPageState) {
                return _buildMyIncomesListView(myIncomesPageState.incomes);
              } else {
                return Container();
              }
              //todo fill with other states
            }
        ),
      ),
    );
  }

  Widget _buildMyIncomesListView(List<Income> incomes) {
    //todo create listview
    return Container();
  }

  void _redirectToNewIncomePage() {
    _homePageAction.redirectToNewIncomePage();
  }
}