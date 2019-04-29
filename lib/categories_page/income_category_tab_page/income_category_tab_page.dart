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

  @override
  Widget build(BuildContext context) {
    initIncomeCategoryTabPresenter();
    return new Scaffold(
      body: mainWidget,
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
  void showIncomeCategoriesView(List<IncomeCategory> incomeCategories) {
    if (incomeCategories != null && incomeCategories.isNotEmpty) {
      setState(() {
        mainWidget = new Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new ListView.builder(
                  itemCount: incomeCategories.length,
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
