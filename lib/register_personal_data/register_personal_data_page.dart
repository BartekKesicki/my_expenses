import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/model/register_personal_data_model.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_page.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_bloc.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_event.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_state.dart';

class RegisterPersonalDataPage extends StatefulWidget {

  RegisterPersonalDataPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPersonalDataPageState();

}

class _RegisterPersonalDataPageState extends State<RegisterPersonalDataPage> {

  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final registerBloc = RegisterPersonalDataBloc();

  //todo fix behaviour of back button

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
            child: BlocListener(
          bloc: registerBloc,
          listener: (BuildContext context,
              RegisterPersonalDataState registerPersonalDataState) {
            if (registerPersonalDataState is BackButtonState) {
                Navigator.pop(context);
            } else if (registerPersonalDataState is ResponseRegisterPersonalDataState &&
                registerPersonalDataState.isValid) {
              redirectToRegisterExpenseDataPage(
                  context, registerPersonalDataState.model);
            }
          },
          child: BlocProvider(
            builder: (BuildContext context) => registerBloc,
            child: BlocBuilder(
                bloc: registerBloc,
                builder: (BuildContext context,
                    RegisterPersonalDataState registerPersonalDataState) {
                  if (registerPersonalDataState
                      is InitialRegisterPersonalDataState) {
                    return buildMainRegisterForm(
                        context,
                        registerPersonalDataState.usernameErrorMessage,
                        registerPersonalDataState.passwordErrorMessage,
                        registerPersonalDataState.confirmPasswordErrorMessage);
                  } else if (registerPersonalDataState
                      is RegisterPersonalDataInProgressState) {
                    return buildSubmitInProgressWidget();
                  } else if (registerPersonalDataState
                          is ResponseRegisterPersonalDataState &&
                      !registerPersonalDataState.isValid) {
                    return buildMainRegisterForm(context,
                        registerPersonalDataState.optionalMessage, null, null);
                  }
                  return Container();
                }),
          ),
        )),
      ),
    );
  }

  Column buildMainRegisterForm(
      BuildContext context,
      String usernameErrorMessage,
      String passwordErrorMessage,
      String confirmPasswordErrorMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        AppWidgets.createTopLabelsContainer(
            AppWidgets.createText(
                AppStrings.personalData, AppStyles.createTitleTextStyle()),
            EdgeInsets.all(AppDimens.containerSideMargin)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.containerSideMargin,
                  right: AppDimens.containerSideMargin),
              child: TextField(
                decoration: AppStyles.createTextFieldDecoration(
                    AppStrings.email, usernameErrorMessage),
                controller: _userTextController,
                onChanged: (value) {
                  final registerBloc =
                      BlocProvider.of<RegisterPersonalDataBloc>(context);
                  registerBloc.dispatch(ValidateRegisterPersonalDataEvent(
                      _userTextController.text,
                      _passwordTextController.text,
                      _confirmPasswordTextController.text));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.containerSideMargin,
                  right: AppDimens.containerSideMargin),
              child: TextField(
                decoration: AppStyles.createTextFieldDecoration(
                    AppStrings.password, passwordErrorMessage),
                controller: _passwordTextController,
                obscureText: true,
                onChanged: (value) {
                  final registerBloc =
                      BlocProvider.of<RegisterPersonalDataBloc>(context);
                  registerBloc.dispatch(ValidateRegisterPersonalDataEvent(
                      _userTextController.text,
                      _passwordTextController.text,
                      _confirmPasswordTextController.text));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.containerSideMargin,
                  right: AppDimens.containerSideMargin),
              child: TextField(
                decoration: AppStyles.createTextFieldDecoration(
                    AppStrings.confirmPassword, confirmPasswordErrorMessage),
                controller: _confirmPasswordTextController,
                obscureText: true,
                onChanged: (value) {
                  final registerBloc =
                      BlocProvider.of<RegisterPersonalDataBloc>(context);
                  registerBloc.dispatch(ValidateRegisterPersonalDataEvent(
                      _userTextController.text,
                      _passwordTextController.text,
                      _confirmPasswordTextController.text));
                },
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(
                left: AppDimens.containerSideMargin,
                right: AppDimens.containerSideMargin,
                top: AppDimens.containerTopMargin),
            child: AppWidgets.createSubmitButton(() {
              final registerBloc =
                  BlocProvider.of<RegisterPersonalDataBloc>(context);
              registerBloc.dispatch(SubmitRegisterPersonalDataEvent(
                  _userTextController.text,
                  _passwordTextController.text,
                  _confirmPasswordTextController.text));
            },
                AppWidgets.createText(
                    AppStrings.next, AppStyles.createButtonTextStyle())))
      ],
    );
  }

  Widget buildSubmitInProgressWidget() {
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

  redirectToRegisterExpenseDataPage(
      BuildContext context, RegisterPersonalDataModel model) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => RegisterExpenseDataPage(
              model: model,
            )));
  }

  Future<bool> _onWillPop() async {
    registerBloc.dispatch(BackButtonEvent());
    return true;
  }
}