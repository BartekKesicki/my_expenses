import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_view.dart';
import 'package:my_expenses/new_income_page/new_income_page.dart';

class IncomeTabPage extends StatefulWidget {
  IncomeTabPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IncomeTabPageState createState() => _IncomeTabPageState();
}

class _IncomeTabPageState extends BasePageState<IncomeTabPage>
    implements IncomeTabView {
  IncomeTabPresenter presenter;
  Widget mainWidget;
  TextEditingController editingController = TextEditingController();
  List<Income> incomes = List();

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return incomes.isEmpty
        ? createNoContentWidget("No incomes", "ADD FIRST INCOME", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewIncomePage()));
          })
        : new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: new TextField(
                  onChanged: (String value) {
                    if (value != null) {

                    }
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: incomes.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          incomes[position].name,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: createRaisedButton(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewIncomePage()));
                }, createText("ADD INCOME", createButtonTextStyle())),
              )
            ],
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
  void updateIncomesList(List<Income> incomes) {
    setState(() {
      if (incomes != null) {
        this.incomes = incomes;
      }
    });
  }

  @override
  void showNoIncomesView() {
    setState(() {
      mainWidget = createNoContentWidget("No Incomes", "ADD FIRST INCOME", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewIncomePage()));
      });
    });
  }
}
