import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/model/register_personal_data_model.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_bloc.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_state.dart';

class RegisterExpenseDataPage extends StatelessWidget {

  final _registerBloc = RegisterExpenseDataBloc();
  final RegisterPersonalDataModel model;

  RegisterExpenseDataPage({this.model});

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
                    if (registerExpenseDataState is InitialRegisterExpenseDataState) {
                      return buildInitialRegisterExpenseForm(null, null, context);
                    } else if (registerExpenseDataState is RegisterExpenseDataInProgressState) {
                      return buildRegisterInProgressWidget();
                    } else if (registerExpenseDataState is ResponseRegisterExpenseDataState && registerExpenseDataState.isRegistered) {
                      redirectToLoginPage();
                    } else if (registerExpenseDataState is ResponseRegisterExpenseDataState && !registerExpenseDataState.isRegistered) {
                      return buildInitialRegisterExpenseForm(registerExpenseDataState.optionalMessage, null, context);
                    }
                    return buildInitialRegisterExpenseForm(null, null, context);
                  })
          ),
        ),
      ),
    );
  }

  Widget buildInitialRegisterExpenseForm(String startFundsErrorMessage, String salaryErrorMessage, BuildContext context) {
    //todo fill page
    return Container();
  }

  Widget buildRegisterInProgressWidget() {
    //todo fill page
    return Container();
  }

  redirectToLoginPage() {
    //todo redirect to Login page
  }

}