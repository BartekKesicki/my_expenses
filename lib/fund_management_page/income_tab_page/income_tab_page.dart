import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_view.dart';
import 'package:my_expenses/new_income_page/new_income_page.dart';

class IncomeTabPage extends StatefulWidget {
  IncomeTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _IncomeTabPageState createState() => _IncomeTabPageState();
}

class _IncomeTabPageState extends BasePageState<IncomeTabPage>
    implements IncomeTabView {
  IncomeTabPresenter presenter;
  Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return new Scaffold(
      body: mainWidget,
    );
  }

  void initHomePresenter() {
    if (presenter == null) {
      presenter = IncomeTabPresenter();
      presenter.attach(this);
      presenter.loadIncomesList();
    }
  }

  @override
  void showIncomesListView(List<Income> incomes) {
    if (incomes != null && incomes.isNotEmpty) {
      setState(() {
        mainWidget = new Text("THERE IS SOME NEW INCOMES");
        //todo init incomes list
      });
    } else {
      showNoIncomesView();
    }
  }

  @override
  void showNoIncomesView() {
    setState(() {
      mainWidget = createNoContentWidget("THERE IS NO INCOMES YET", "ADD NEW INCOME", () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewIncomePage()));
      });
    });
  }


}
