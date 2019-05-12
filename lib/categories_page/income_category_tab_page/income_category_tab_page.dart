import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_state_presenter.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_view.dart';
import 'package:my_expenses/db/model/income_category.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_page.dart';

class IncomeCategoryTabPage extends StatefulWidget {
  IncomeCategoryTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _IncomeCategoryTabPageState createState() => _IncomeCategoryTabPageState();
}

class _IncomeCategoryTabPageState extends BasePageState<IncomeCategoryTabPage>
    implements IncomeCategoryTabStateView {
  IncomeCategoryTabStatePresenter presenter;
  Widget mainWidget;
  List<IncomeCategory> incomeCategories = List();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initIncomeCategoryTabPresenter();
    return incomeCategories.isEmpty
        ? createNoContentWidget(
            "No Income Categories", "ADD FIRST INCOME CATEGORY", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewIncomeCategoryPage()));
          })
        : new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: new TextField(
                  onChanged: (String value) {
                    //todo listener
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
                  itemCount: incomeCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          incomeCategories[position].name,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewIncomeCategoryPage()));
                }, createText("ADD INCOME CATEGORY", createButtonTextStyle())),
              )
            ],
          );
  }

  void initIncomeCategoryTabPresenter() {
    if (presenter == null) {
      presenter = IncomeCategoryTabStatePresenter();
      presenter.attach(this);
      presenter.loadIncomeCategories();
    }
  }

  @override
  void updateIncomeCategoriesList(List<IncomeCategory> incomeCategories) {
    if (incomeCategories != null && incomeCategories.isNotEmpty) {
      setState(() {
        mainWidget = new Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new ListView.builder(
                  itemCount: incomeCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          incomeCategories[position].name,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    );
                  },
                ),
                createRaisedButton(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewIncomeCategoryPage()));
                }, createText("ADD INCOME CATEGORY", createButtonTextStyle()))
              ],
            ));
      });
    } else {
      showNoIncomeCategoryView();
    }
  }

  @override
  void showNoIncomeCategoryView() {
    setState(() {
      mainWidget = createNoContentWidget(
          "No Income Categories", "ADD FIRST INCOME CATEGORY", () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewIncomeCategoryPage()));
      });
    });
  }
}
