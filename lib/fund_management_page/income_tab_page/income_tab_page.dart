import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_listed_page_state.dart';
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

class _IncomeTabPageState extends BaseListedPageState<IncomeTabPage>
    implements IncomeTabView {
  IncomeTabPresenter presenter;
  Widget mainWidget;
  List<Income> incomes = List();

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return incomes.isEmpty
        ? AppWidgets.createNoContentWidget(AppStrings.noIncomes, AppStrings.addNewIncome, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewIncomePage()));
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
                  createFilterListButton(),
                ],
              ),
              new Expanded(
                child: new ListView.builder(
                  itemCount: incomes.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return createListItemTile(incomes[position].name, () {
                      showListItemDialog(context, AppStrings.edit, AppStrings.doYouWantEditThisItem, () {
                        //todo redirect to edit item
                      });
                    }, () {
                      showListItemDialog(context, AppStrings.delete, AppStrings.doYouWantDeleteThisItem, () {
                        //todo delete item
                      });
                    }, incomes[position].timestamp);
                  },
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: AppDimens.bottomButtonDefaultMargin, bottom: AppDimens.bottomButtonDefaultMargin, left: AppDimens.bottomButtonDefaultMargin, right: AppDimens.bottomButtonDefaultMargin),
                child: AppWidgets.createRaisedButton(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewIncomePage()));
                }, AppWidgets.createText(AppStrings.addIncome, AppStyles.createButtonTextStyle())),
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
      mainWidget = AppWidgets.createNoContentWidget(AppStrings.noIncomes, AppStrings.addNewIncome, () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewIncomePage()));
      });
    });
  }
}
