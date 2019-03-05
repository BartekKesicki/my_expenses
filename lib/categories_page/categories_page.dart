
import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/categories_state_presenter.dart';
import 'package:my_expenses/categories_page/categories_state_view.dart';

class CategoriesPage extends StatefulWidget {

  CategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _CategoriesPageState();

}

class _CategoriesPageState extends BasePageState<CategoriesPage> implements CategoriesStateView {

  CategoriesStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      body: Center(
        child: Text("CATEGORIES"),
      ),
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new CategoriesStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

}