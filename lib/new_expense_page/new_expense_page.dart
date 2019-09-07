import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/home/home_page.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_presenter.dart';
import 'package:my_expenses/new_expense_page/new_expense_state_view.dart';
import 'package:my_expenses/new_expense_page/new_expense_validator.dart';

class NewExpensePage extends StatefulWidget {
  NewExpensePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewExpensePageState createState() => _NewExpensePageState();
}

class _NewExpensePageState extends BasePageState<NewExpensePage>
    implements NewExpenseStateView {
  NewExpenseStatePresenter presenter;
  List<ExpenseCategory> categories;
  bool categoryExists = false;
  String dropDownCategory;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
        body: Column(children: <Widget>[
      AppWidgets.createSizedBox(30.0),
      Center(
        child: AppWidgets.createText(AppStrings.newExpense, AppStyles.createSubTitleTextStyle()),
      ),
          AppWidgets.createSizedBox(10.0),
      Container(
          padding: EdgeInsets.only(top: AppDimens.containerTopMargin, left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
          child: Form(
              key: presenter.getFormKey,
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.expenseName),
                  validator: (String value) {
                    if (!NewExpenseValidator.isExpenseNameValid(value)) {
                      return AppStrings.incorrectExpenseName;
                    }
                  },
                  onSaved: (String value) {
                    presenter.expenseFormModel.name = value;
                  },
                ),
                TextFormField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.amount),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (!NewExpenseValidator.isExpenseAmountValid(value)) {
                      return AppStrings.incorrectExpenseAmount;
                    }
                  },
                  onSaved: (String value) {
                    presenter.expenseFormModel.price = double.parse(value);
                  },
                ),
                categoryExists
                    ? new DropdownButton<String>(
                        value: dropDownCategory,
                        onChanged: onChangedDropDownItem,
                        hint: Text(AppStrings.pleaseChooseCategory),
                        items: categories.map((ExpenseCategory category) {
                          return new DropdownMenuItem<String>(
                            child: new Text(category.name),
                            value: category.name,
                          );
                        }).toList(),
                      )
                    : new TextFormField(
                        decoration: AppStyles.createTextFieldDecoration(AppStrings.newCategory),
                        validator: (String value) {
                          if (!NewExpenseValidator.isExpenseCategoryValid(
                              value)) {
                            return AppStrings.inCorrectCategory;
                          }
                        },
                        onSaved: (String value) {
                          presenter.category = value;
                        },
                      ),
                AppWidgets.createSizedBox(20.0),
                AppWidgets.createRaisedButton(() {
                  presenter.performAddExpense();
                }, AppWidgets.createText(AppStrings.addExpense, AppStyles.createButtonTextStyle())),
              ])))
    ]));
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = NewExpenseStatePresenter();
      presenter.attach(this);
      presenter.performToLoadCategories();
    }
  }

  @override
  void buildExpenseCategoriesDropDownList(List<ExpenseCategory> list) {
    setState(() {
      categoryExists = true;
      categories = list;
      dropDownCategory = list[0].name;
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
  void onExpenseInserted() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }
}
