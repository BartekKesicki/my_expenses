import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/categories_state_presenter.dart';
import 'package:my_expenses/categories_page/categories_state_view.dart';
import 'package:my_expenses/categories_page/expense_category_tab_page/expense_category_tab_page.dart';
import 'package:my_expenses/categories_page/income_category_tab_page/income_category_tab_page.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends BasePageState<CategoriesPage>
    implements CategoriesStateView {

  CategoriesStatePresenter presenter;
  IncomeCategoryTabPage incomeCategoriesTabPage;
  ExpenseCategoryTabPage expenseCategoriesTabPage;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: AppStrings.incomeCategories,
                ),
                Tab(
                  text: AppStrings.expenseCategories,
                ),
              ],
            ),
            title: Text(AppStrings.categories),
          ),
          body: TabBarView(
            children: [
              incomeCategoriesTabPage,
              expenseCategoriesTabPage,
            ],
          ),
        )
    );
  }

  void initPresenter() {
    var id = -1;
    if (presenter == null) {
      presenter = new CategoriesStatePresenter();
      presenter.attach(this);
    }
    if (incomeCategoriesTabPage == null) {
      incomeCategoriesTabPage = IncomeCategoryTabPage(id);
    }
    if (expenseCategoriesTabPage == null) {
      expenseCategoriesTabPage = ExpenseCategoryTabPage(id);
    }
  }
}
