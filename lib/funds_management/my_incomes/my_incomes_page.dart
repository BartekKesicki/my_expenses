import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/funds_management/my_incomes/my_incomes_bloc.dart';
import 'package:my_expenses/funds_management/my_incomes/my_incomes_state.dart';

class MyIncomesPage extends StatefulWidget {

  MyIncomesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MyIncomesPageState();

}

class _MyIncomesPageState extends State<MyIncomesPage> {

  final _myIncomesBloc = MyIncomesPageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
    );
  }

  Widget _buildMyIncomesListView(List<Income> incomes) {
    return Container();
  }
}