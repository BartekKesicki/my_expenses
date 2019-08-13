import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/constants/validation_messages_constants.dart';
import 'package:my_expenses/home/home_page.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_state_presenter.dart';
import 'package:my_expenses/new_income_category_page/new_income_category_state_view.dart';

class NewIncomeCategoryPage extends StatefulWidget {
  NewIncomeCategoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _NewIncomeCategoryPageState();
}

class _NewIncomeCategoryPageState extends BasePageState<NewIncomeCategoryPage>
    implements NewIncomeCategoryStateView {
  NewIncomeCategoryStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
        body: Column(children: <Widget>[
          AppWidgets.createSizedBox(30.0),
          Center(
            child: AppWidgets.createText(AppStrings.newIncomeCategory, AppStyles.createSubTitleTextStyle()),
          ),
      Container(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Form(
              key: presenter.getFormKey,
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: AppStyles.createTextFieldDecoration(AppStrings.incomeCategoryName),
                  validator: (String value) {
                    if (!presenter.isCategoryNameValid(value)) {
                      return ValidationMessagesConstants
                          .THIS_FIELD_CANT_BE_EMPTY;
                    }
                  },
                  onSaved: (String value) {
                    presenter.incomeName = value;
                  },
                ),
                AppWidgets.createSizedBox(30.0),
                AppWidgets.createRaisedButton(() {
                  presenter.performAddNewIncomeCategoryName();
                }, AppWidgets.createText(AppStrings.addNewIncomeCategory, AppStyles.createButtonTextStyle())),
              ])))
    ]));
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = new NewIncomeCategoryStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void insertionFailed() {
    showMessage(AppStrings.insertionFailed);
  }

  @override
  void insertionSucceed() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
  }
}
