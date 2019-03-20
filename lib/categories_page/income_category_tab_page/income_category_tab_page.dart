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

  @override
  void showMessage(String message) {}

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
        mainWidget = new Text("THERE IS SOME INCOME CATEGORY");
        //todo init income categories list view
      });
    } else {
      showNoIncomeCategoryView();
    }
  }

  @override
  void showNoIncomeCategoryView() {
    setState(() {
      mainWidget = createNoContentWidget("THERE IS NO INCOME CATEGORIES", "ADD NEW INCOME CATEGORY", () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewIncomeCategoryPage()));
      });
    });
  }
}