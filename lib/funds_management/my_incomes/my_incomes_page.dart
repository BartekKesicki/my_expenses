import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
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
  final _incomesSearchbarControllerText = TextEditingController();
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
    return Container(
      child: Column(
        children: <Widget>[
          createSearchbar(),
          createListView(incomes)
        ],
      ),
    );
  }

  void _redirectToNewIncomePage() {
    _homePageAction.redirectToNewIncomePage();
  }

  Widget createSearchbar() {
    //todo change focused border color
    return Padding(
      padding: EdgeInsets.all(AppDimens.searchBarPadding),
      child: TextField(
        controller: _incomesSearchbarControllerText,
        decoration: AppStyles.createSearchBarTextFieldDecoration(AppStrings.search),
      ),
    );
  }

  Widget createListView(List<Income> incomes) {
    //todo create listviewbuilder
    return Container();
  }
}