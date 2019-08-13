import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_strings.dart';

class BasePageState<V extends StatefulWidget> extends State<V> {
  @override
  Widget build(BuildContext context) {}

  void showMessage(String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(message),
    ));
  }
}
