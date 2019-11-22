import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/login/login_page.dart';
import 'package:my_expenses/model/register_personal_data_model.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_bloc.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_event.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_state.dart';

class RegisterExpenseDataPage extends StatefulWidget {

  final RegisterPersonalDataModel model;

  RegisterExpenseDataPage({this.model, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterExpenseDataPageState();
}

class _RegisterExpenseDataPageState extends State<RegisterExpenseDataPage> {

  final _registerBloc = RegisterExpenseDataBloc();
  RegisterPersonalDataModel model;
  final _startFundsTextController = TextEditingController();
  final _salaryTextController = TextEditingController();
  final _optionalLimitTextController = TextEditingController();

  //todo fix behaviour of back button

  _RegisterExpenseDataPageState({this.model});

  @override
  Widget build(BuildContext context) {
    model = widget.model;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: BlocListener(
          listener: (BuildContext context, RegisterExpenseDataState registerExpenseDataState) {
            if (registerExpenseDataState is BackButtonState) {
              Navigator.pop(context);
            } else if (registerExpenseDataState is ResponseRegisterExpenseDataState && registerExpenseDataState.isRegistered) {
              redirectToLoginPage(context);
            }
          },
          bloc: _registerBloc,
          child: BlocProvider(
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
                        } else if (registerExpenseDataState is ResponseRegisterExpenseDataState && !registerExpenseDataState.isRegistered) {
                          return buildInitialRegisterExpenseForm(registerExpenseDataState.optionalMessage, null, context);
                        }
                        return buildInitialRegisterExpenseForm(null, null, context);
                      })
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInitialRegisterExpenseForm(String startFundsErrorMessage, String salaryErrorMessage, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        AppWidgets.createTopLabelsContainer(AppWidgets.createText(AppStrings.expensesData, AppStyles.createTitleTextStyle()), EdgeInsets.all(AppDimens.containerSideMargin)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
              child: TextField(
                controller: _startFundsTextController,
                decoration: AppStyles.createTextFieldDecoration(AppStrings.startFunds, startFundsErrorMessage),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final registerBloc = BlocProvider.of<RegisterExpenseDataBloc>(context);
                  registerBloc.dispatch(ValidateRegisterExpenseDataEvent(_startFundsTextController.text, _salaryTextController.text));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
              child: TextField(
                controller: _salaryTextController,
                decoration: AppStyles.createTextFieldDecoration(AppStrings.yourIncome, salaryErrorMessage),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final registerBloc = BlocProvider.of<RegisterExpenseDataBloc>(context);
                  registerBloc.dispatch(ValidateRegisterExpenseDataEvent(_startFundsTextController.text, _salaryTextController.text));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
              child: TextField(
                controller: _optionalLimitTextController,
                keyboardType: TextInputType.number,
                decoration: AppStyles.createTextFieldDecoration(AppStrings.monthlyLimit, null),
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin, top: AppDimens.containerTopMargin),
            child: AppWidgets.createSubmitButton(() {
              final registerBloc = BlocProvider.of<RegisterExpenseDataBloc>(context);
              registerBloc.dispatch(SubmitRegisterExpenseDataEvent(_startFundsTextController.text, _salaryTextController.text, _optionalLimitTextController.text, model));
            }, AppWidgets.createText(AppStrings.registerUser, AppStyles.createButtonTextStyle()))
        )
      ],
    );
  }

  Widget buildRegisterInProgressWidget() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(),
            Text(AppStrings.processingData)
          ],
        ),
      ),
    );
  }

  redirectToLoginPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

  Future<bool> _onWillPop() async {
    _registerBloc.dispatch(BackButtonEvent());
    return true;
  }
}