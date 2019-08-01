import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/base/base_listed_page_state.dart';
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

class _IncomeCategoryTabPageState extends BaseListedPageState<IncomeCategoryTabPage>
    implements IncomeCategoryTabStateView {
  IncomeCategoryTabStatePresenter presenter;
  Widget mainWidget;
  List<IncomeCategory> incomeCategories = List();


  @override
  Widget build(BuildContext context) {
    initIncomeCategoryTabPresenter();
    return incomeCategories.isEmpty
        ? createNoContentWidget(
           AppStrings.noIncomeCategories, AppStrings.addFirstIncomeCategory, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewIncomeCategoryPage()));
          })
        : new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  createSearchBarContent((String value) {
                    if (value != null) {
                      presenter.loadIncomesByName(value);
                    }
                  }),
                  closeButton,
                  createFilterListButton()
                ],
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: incomeCategories.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return createListItemTile(incomeCategories[position].name, () {
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
                child: createRaisedButton(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewIncomeCategoryPage()));
                }, createText(AppStrings.addIncomeCategory, createButtonTextStyle())),
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
          AppStrings.noIncomeCategories, AppStrings.addFirstIncomeCategory, () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewIncomeCategoryPage()));
      });
    });
  }
}
