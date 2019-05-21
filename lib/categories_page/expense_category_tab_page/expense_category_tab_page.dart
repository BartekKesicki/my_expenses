import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_presenter.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_state_view.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_page.dart';

class ExpenseCategoryTabPage extends StatefulWidget {
  ExpenseCategoryTabPage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _ExpenseCategoryTabPageState createState() => _ExpenseCategoryTabPageState();
}

class _ExpenseCategoryTabPageState extends BasePageState<ExpenseCategoryTabPage>
    implements ExpenseCategoryTabStateView {
  ExpenseCategoryTabStatePresenter presenter;
  Widget mainWidget;
  Widget closeButton = new Container();
  var searchBarWidth = 100.0;
  bool isExpanded = false;
  List<ExpenseCategory> expenseCategories = new List();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initExpenseCategoryTabPresenter();
    return expenseCategories.isEmpty
        ? createNoContentWidget(
            "No expense Categories", "ADD FIRST EXPENSE CATEGORY", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewExpenseCategoryPage()));
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
                                presenter.loadExpensesByName(value);
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
                  itemCount: expenseCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return ExpansionTile(
                      title: Text(
                        expenseCategories[position].name,
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
                                            //todo edit expensecategory
                                          },
                                      icon: new Icon(Icons.edit,
                                          color: Colors.green),
                                    ),
                                    new IconButton(
                                      color: Colors.white,
                                      onPressed: () => {
                                            //todo delete expensecategory
                                          },
                                      icon: new Icon(Icons.delete,
                                          color: Colors.green),
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
                          builder: (context) => NewExpenseCategoryPage()));
                }, createText("ADD EXPENSE CATEGORY", createButtonTextStyle())),
              )
            ],
          );
  }

  void initExpenseCategoryTabPresenter() {
    if (presenter == null) {
      presenter = ExpenseCategoryTabStatePresenter();
      presenter.attach(this);
      presenter.loadExpensesCategories();
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
    });
  }

  @override
  void updateExpensesCategoriesList(List<ExpenseCategory> categories) {
    setState(() {
      if (categories != null) {
        this.expenseCategories = categories;
      }
    });
  }

  @override
  void showNoExpenseCategoriesView() {
    setState(() {
      mainWidget = createNoContentWidget(
          "No expense Categories", "ADD FIRST EXPENSE CATEGORY", () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewExpenseCategoryPage()));
      });
    });
  }

  @override
  void showErrorMessage(String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Searching Error"),
    ));
  }
}
