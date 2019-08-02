import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/fund_management_page/fund_management_state_presenter.dart';
import 'package:my_expenses/fund_management_page/fund_management_state_view.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_page.dart';
import 'package:my_expenses/fund_management_page/expense_tab_page/expense_tab_page.dart';

class FundManagementPage extends StatefulWidget {
  FundManagementPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _FundManagementState();
}

class _FundManagementState extends BasePageState<FundManagementPage>
    implements FundManagementStateView {
  FundManagementStatePresenter presenter;
  IncomeTabPage incomeTabPage;
  ExpenseTabPage outcomeTabPage;

  @override
  Widget build(BuildContext context) {
    initPresenterAndTabViews();
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: AppStrings.incomes,
                ),
                Tab(
                  text: AppStrings.expenses,
                ),
              ],
            ),
            title: Text(AppStrings.fundsManagement),
          ),
          body: TabBarView(
            children: [
              incomeTabPage,
              outcomeTabPage,
            ],
          ),
        ));
  }

  void initPresenterAndTabViews() {
    if (presenter == null) {
      presenter = new FundManagementStatePresenter();
      presenter.attach(this);
    }
    if (incomeTabPage == null) {
      incomeTabPage = IncomeTabPage();
    }
    if (outcomeTabPage == null) {
      outcomeTabPage = ExpenseTabPage();
    }
  }
}
