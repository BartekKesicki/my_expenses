import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/home/home_state_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> implements HomeStateView {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }
}