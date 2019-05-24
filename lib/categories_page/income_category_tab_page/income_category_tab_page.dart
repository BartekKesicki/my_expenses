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
  Widget closeButton = new Container();
  var searchBarWidth = 100.0;
  List<IncomeCategory> incomeCategories = List();
  TextEditingController editingController = TextEditingController();
  FocusNode myFocusNode = FocusNode();

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
                  itemCount: incomeCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return ExpansionTile(
                      title: Text(
                        incomeCategories[position].name,
                        style: TextStyle(fontSize: 22.0),
                      ),
                      children: <Widget>[
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                  child: new Text(""),
                                ),
                                new Row(
                                  children: <Widget>[
                                    new IconButton(
                                      color: Colors.white,
                                      onPressed: () => {
                                        //todo edit incomecategory
                                      },
                                      icon: new Icon(Icons.edit, color: Colors.green) ,
                                    ),
                                    new IconButton(
                                      color: Colors.white,
                                      onPressed: () => {
                                        //todo delete incomecategory
                                      },
                                      icon: new Icon(Icons.delete, color: Colors.green) ,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
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
  void updateIncomeCategoriesList(List<IncomeCategory> incomeCategories) {
    if (incomeCategories != null) {
      setState(() {
         this.incomeCategories = incomeCategories;
      });
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
