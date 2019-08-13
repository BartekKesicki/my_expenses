import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_listed_page_state.dart';
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

class _ExpenseCategoryTabPageState extends BaseListedPageState<ExpenseCategoryTabPage>
    implements ExpenseCategoryTabStateView {
  ExpenseCategoryTabStatePresenter presenter;
  Widget mainWidget;
  List<ExpenseCategory> expenseCategories = new List();

  @override
  Widget build(BuildContext context) {
    initExpenseCategoryTabPresenter();
    return expenseCategories.isEmpty
        ? AppWidgets.createNoContentWidget(
            AppStrings.noExpenseCategories, AppStrings.addFirstExpenseCategory, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewExpenseCategoryPage()));
          })
        : new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  createSearchBarContent((String value) {
                    if (value != null) {
                      presenter.loadExpensesByName(value);
                    }
                  }),
                  closeButton,
                  createFilterListButton()
                ],
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: expenseCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return createListItemTile(expenseCategories[position].name, () {
                      showListItemDialog(context, AppStrings.edit, AppStrings.doYouWantEditThisItem, () {
                        //todo redirect to edit item
                      });
                    }, () {
                      showListItemDialog(context, AppStrings.delete, AppStrings.doYouWantDeleteThisItem, () {
                        //todo delete item
                      });
                    }, -1);
                  },
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: AppWidgets.createRaisedButton(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewExpenseCategoryPage()));
                }, AppWidgets.createText(AppStrings.addExpenseCategory, AppStyles.createButtonTextStyle())),
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
      mainWidget = AppWidgets.createNoContentWidget(
          AppStrings.noExpenseCategories, AppStrings.addFirstExpenseCategory, () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewExpenseCategoryPage()));
      });
    });
  }

  @override
  void showErrorMessage(String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(AppStrings.searchingError),
    ));
  }
}
