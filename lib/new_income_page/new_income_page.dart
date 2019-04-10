import 'package:flutter/material.dart';
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
    //todo fill the title
    initPresenter();
    return new Scaffold(
        body: Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Form(
              key: presenter.getFormKey,
              child: Column(children: <Widget>[
                createSizedBox(20.0),
                TextFormField(
                  decoration: createTextFieldDecoration("INCOME NAME"),
                  validator: (String value) {
                    //todo check existing income name
                    if (!NewIncomeValidator.isIncomeNameValid(value)) {
                      return "INCORRECT NAME";
                    }
                  },
                  onSaved: (String value) {
                    presenter.model.name = value;
                  },
                ),
                createSizedBox(20.0),
                TextFormField(
                  decoration: createTextFieldDecoration("AMOUNT"),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (!NewIncomeValidator.isIncomeAmountValid(value)) {
                      return "INCORRECT AMOUNT";
                    }
                  },
                  onSaved: (String value) {
                    presenter.model.amount = double.parse(value);
                  },
                ),
                createSizedBox(20.0),
                categoryExists
                    ? DropdownButton(
                        hint: Text('Please choose category'),
                        value: dropDownCategory,
                        onChanged: onChangedDropDownItem,
                        items: categories.map((item) {
                          return DropdownMenuItem(
                            child: new Text(item.name),
                            value: item.name,
                          );
                        }).toList(),
                      )
                    : TextFormField(
                        decoration: createTextFieldDecoration("NEW CATEGORY"),
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (!NewIncomeValidator.isIncomeNameValid(value)) {
                            return "INCORRECT CATEGORY";
                          }
                        },
                        onSaved: (String value) {
                          presenter.category = value;
                        },
                      ),
                createSizedBox(20.0),
                createRaisedButton(() {
                  presenter.performToAddNewIncome();
                }, createText("SUBMIT BUTTON", createButtonTextStyle())),
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
