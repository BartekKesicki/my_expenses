import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_bloc.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_state.dart';

class RegisterExpenseDataPage extends StatelessWidget {

  final _registerBloc = RegisterExpenseDataBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => _registerBloc,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: BlocBuilder(
                  bloc: _registerBloc,
                  builder : (BuildContext context, RegisterExpenseDataState registerExpenseDataState) {
                    //todo fill with forms
                  })
          ),
        ),
      ),
    );
  }

}