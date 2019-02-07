
import 'package:flutter/material.dart';

class BasePageState<V extends StatefulWidget> extends State<V> {

  @override
  Widget build(BuildContext context) {}

  Container createTopLabelsContainer(Text text, EdgeInsets insets) {
    return new Container(
      padding: insets,
      child: text,
    );
  }

  SizedBox createSizedBox(double height) {
    return new SizedBox(height: height,);
  }

  Text createText(String label, TextStyle textStyle) {
    return new Text(label, style: textStyle,);
  }

  TextStyle createTitleTextStyle() {
    return new TextStyle(fontSize : 80.0, fontWeight: FontWeight.bold);
  }

  TextStyle createSubTitleTextStyle() {
    return new TextStyle(fontSize: 40.0, fontWeight: FontWeight.normal);
  }

  TextStyle createButtonTextStyle() {
    return new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Montserrat");
  }

  InputDecoration createTextFieldDecoration(String labelText) {
    return new InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey)
    );
  }

  TextStyle createHyperLinkTextStyle() {
    return new TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decoration: TextDecoration.underline);
  }

  Container createSubmitButton(GestureTapCallback callback, Text centerText) {
    return new Container(
      height: 50,
      child: Material(
        borderRadius: BorderRadius.circular(25.0),
        shadowColor: Colors.lightGreen,
        color: Colors.green,
        elevation: 7.0,
        child: GestureDetector(
          onTap: callback,
          child: Center(
            child: centerText
          ),
        ),
        )
    );
  }

}