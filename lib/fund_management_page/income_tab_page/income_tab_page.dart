import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/income.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_presenter.dart';
import 'package:my_expenses/fund_management_page/income_tab_page/income_tab_view.dart';
import 'package:my_expenses/new_income_page/new_income_page.dart';
import 'package:my_expenses/utils/date_calculator.dart';

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
  Widget closeButton = new Container();
  var searchBarWidth = 100.0;
  TextEditingController editingController = TextEditingController();
  List<Income> incomes = List();
  FocusNode myFocusNode = FocusNode();

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
              new Row(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new AnimatedContainer(
                      duration: new Duration(milliseconds: 300),
                      width: searchBarWidth,
                      child: new Container(
                        child: new Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                          child: new TextField(
                            focusNode: myFocusNode,
                            onTap: () => expandSearchBar(),
                            onChanged: (String value) {
                              if (value != null) {
                                presenter.loadIncomesByName(value);
                              }
                            },
                            controller: editingController,
                            decoration: InputDecoration(
                                labelText: "Search",
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0)))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  closeButton,
                  new Expanded(
                      child: new Align(
                          alignment: Alignment.centerRight,
                          child: new Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: new IconButton(
                                icon: new Icon(Icons.filter_list),
                                onPressed: () => {}),
                          )))
                ],
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: incomes.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return ExpansionTile(
                      title: Text(
                        incomes[position].name,
                        style: TextStyle(fontSize: 22.0),
                      ),
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                child: new Text("Created: " + DateCalculator.buildDateTime(incomes[position].timestamp)),
                              ),
                              new Row(
                                children: <Widget>[
                                  new IconButton(
                                    color: Colors.white,
                                    onPressed: () => {
                                      //todo edit expense
                                    },
                                    icon: new Icon(Icons.edit, color: Colors.green) ,
                                  ),
                                  new IconButton(
                                    color: Colors.white,
                                    onPressed: () => {
                                      //todo delete expense
                                    },
                                    icon: new Icon(Icons.delete, color: Colors.green) ,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
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

  void expandSearchBar() {
    setState(() {
      searchBarWidth = 250.0;
      closeButton = new IconButton(
          icon: new Icon(Icons.close), onPressed: () => closeSearchBar());
    });
  }

  void closeSearchBar() {
    setState(() {
      searchBarWidth = 100.0;
      closeButton = new Container();
      editingController.clear();
      myFocusNode.unfocus();
    });
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
