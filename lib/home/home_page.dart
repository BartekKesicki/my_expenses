import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/home/home_state_view.dart';

class HomePage extends StatefulWidget {
  HomePage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> implements HomeStateView {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("TEXT"),
    );
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }
}