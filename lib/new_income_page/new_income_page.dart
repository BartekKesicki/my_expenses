import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/income_category.dart';
import 'package:my_expenses/home/home_page.dart';
import 'package:my_expenses/new_income_page/new_income_state_presenter.dart';
import 'package:my_expenses/new_income_page/new_income_state_view.dart';
import 'package:my_expenses/new_income_page/new_income_validator.dart';

class NewIncomePage extends StatefulWidget {
  NewIncomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewIncomePageState createState() => _NewIncomePageState();
}

class _NewIncomePageState extends BasePageState<NewIncomePage>
    implements NewIncomeStateView {
  NewIncomeStatePresenter presenter;
  List<IncomeCategory> categories;
  bool categoryExists = false;
  String dropDownCategory;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
        body: Column(children: <Widget>[
          AppWidgets.createSizedBox(30.0),
      Center(
        child: AppWidgets.createText(AppStrings.newIncome, AppStyles.createSubTitleTextStyle()),
      ),
          AppWidgets.createSizedBox(10.0),
      Container(
          padding: EdgeInsets.only(top: AppDimens.containerTopMargin, left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
          child: Form(
              key: presenter.getFormKey,
              child: Column(children: <Widget>[
                AppWidgets.createSizedBox(20.0),
                TextFormField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.incomeName),
                  validator: (String value) {
                    if (!NewIncomeValidator.isIncomeNameValid(value)) {
                      return AppStrings.incorrectName;
                    }
                  },
                  onSaved: (String value) {
                    presenter.incomeFormModel.name = value;
                  },
                ),
                AppWidgets.createSizedBox(20.0),
                TextFormField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.amount),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (!NewIncomeValidator.isIncomeAmountValid(value)) {
                      return AppStrings.incorrectAmount;
                    }
                  },
                  onSaved: (String value) {
                    presenter.incomeFormModel.amount = double.parse(value);
                  },
                ),
                AppWidgets.createSizedBox(20.0),
                categoryExists
                    ? new DropdownButton<String>(
                        hint: Text(AppStrings.pleaseChooseCategory),
                        value: dropDownCategory,
                        onChanged: onChangedDropDownItem,
                        items: categories.map((item) {
                          return DropdownMenuItem<String>(
                            child: new Text(dropDownCategory),
                            value: dropDownCategory,
                          );
                        }).toList(),
                      )
                    : TextFormField(
                        decoration: AppStyles.createTextFieldDecoration(AppStrings.newCategory),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (!NewIncomeValidator.isIncomeNameValid(value)) {
                            return AppStrings.inCorrectCategory;
                          }
                        },
                        onSaved: (String value) {
                          presenter.category = value;
                        },
                      ),
                AppWidgets.createSizedBox(20.0),
                AppWidgets.createRaisedButton(() {
                  presenter.performToAddNewIncome();
                }, AppWidgets.createText(AppStrings.submitButton, AppStyles.createButtonTextStyle())),
              ])))
    ]));
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = NewIncomeStatePresenter();
      presenter.attach(this);
      presenter.performToLoadCategories();
    }
  }

  @override
  void buildIncomeCategoriesDropDownList(List<IncomeCategory> list) {
    setState(() {
      categoryExists = true;
      dropDownCategory = list[0].name;
      categories = list;
    });
  }

  void onChangedDropDownItem(String newValue) {
    setState(() {
      presenter.category = newValue;
      dropDownCategory = newValue;
    });
  }

  @override
  void buildTextFieldForNewCategory() {
    setState(() {
      categoryExists = false;
    });
  }

  @override
  void onIncomeInserted() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }
}
