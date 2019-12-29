import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/funds_management/funds_management_bloc.dart';
import 'package:my_expenses/funds_management/funds_management_state.dart';

class FundsManagementPage extends StatefulWidget {

  FundsManagementPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _FundsManagementPageState();

}

class _FundsManagementPageState extends State<FundsManagementPage> {

  final _fundsManagementBloc = FundsManagementPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}