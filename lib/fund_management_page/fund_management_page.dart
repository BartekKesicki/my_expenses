import 'package:flutter/material.dart';
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
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "INCOMES",
                ),
                Tab(
                  text: "EXPENSES",
                ),
              ],
            ),
            title: Text('Funds Management'),
          ),
          body: TabBarView(
            children: [
              incomeTabPage,
              outcomeTabPage,
            ],
          ),
        ));
  }
  //todo fill the page tab view (wip)

  void initPresenterAndTabViews() {
    //todo get user id (temporary mocked)
    var id = -1;
    if (presenter == null) {
      presenter = new FundManagementStatePresenter();
      presenter.attach(this);
    }
    if (incomeTabPage == null) {
      incomeTabPage = IncomeTabPage(id);
    }
    if (outcomeTabPage == null) {
      outcomeTabPage = ExpenseTabPage(id);
    }
  }
}
