import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';
import 'package:my_expenses/home/home_page.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_presenter.dart';
import 'package:my_expenses/new_expense_category_page/new_expense_category_state_view.dart';

class NewExpenseCategoryPage extends StatefulWidget {
  NewExpenseCategoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _NewExpenseCategoryPageState();
}

class _NewExpenseCategoryPageState extends BasePageState<NewExpenseCategoryPage>
    implements NewExpenseCategoryStateView {
  NewExpenseCategoryStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
        body: Column(children: <Widget>[
          AppWidgets.createSizedBox(30.0),
          Center(
            child: AppWidgets.createText(AppStrings.newExpenseCategory, AppStyles.createSubTitleTextStyle()),
          ),
          Container(
              padding: EdgeInsets.only(top: AppDimens.containerTopMargin, left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
              child: Form(
                  key: presenter.getFormKey,
                  child: Column(children: <Widget>[
                    AppWidgets.createText(AppStrings.expenseCategory, AppStyles.createSubTitleTextStyle()),
                    AppWidgets.createSizedBox(20.0),
                    TextFormField(
                      decoration: AppStyles.createTextFieldDecoration(AppStrings.expenseCategoryName),
                      validator: (String value) {
                        if (!presenter.isCategoryNameValid(value)) {
                          return ValidationMessagesConstants
                              .THIS_FIELD_CANT_BE_EMPTY;
                        }
                      },
                      onSaved: (String value) {
                        presenter.expenseName = value;
                      },
                    ),
                    AppWidgets.createSizedBox(20.0),
                    //todo replace with switch
                    new Row(
                      children: <Widget>[
                        new Checkbox(value: presenter.isBill,
                            onChanged: onCheckBoxValueChanged),
                        AppWidgets.createText(AppStrings.expenseIsBill, AppStyles.createCheckboxTextStyle()),
                      ],
                    ),
                    AppWidgets.createSizedBox(30.0),
                    AppWidgets.createRaisedButton(() {
                      presenter.performAddNewExpenseCategoryName();
                    }, AppWidgets.createText(AppStrings.addNewExpenseCategory, AppStyles.createButtonTextStyle())),
                  ])))
        ]));
  }

  void onCheckBoxValueChanged(bool value) {
    setState(() {
      presenter.onValueChanged(value);
    });
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = new NewExpenseCategoryStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showInsertionFailure() {
    showMessage(AppStrings.insertionFailed);
  }

  @override
  void showInsertionSuccess() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
  }
}
