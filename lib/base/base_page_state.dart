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
    return new SizedBox(
      height: height,
    );
  }

  Text createText(String label, TextStyle textStyle) {
    return new Text(
      label,
      style: textStyle,
    );
  }

  void showMessage(String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(message),
    ));
  }

  TextStyle createTitleTextStyle() {
    return new TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold);
  }

  TextStyle createSubTitleTextStyle() {
    return new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold);
  }

  TextStyle createSimpleLabelTextStyle() {
    return new TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal);
  }

  TextStyle createCheckboxTextStyle() {
    return new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
  }

  TextStyle createButtonTextStyle() {
    return new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat");
  }

  InputDecoration createTextFieldDecoration(String labelText) {
    return new InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.grey));
  }

  TextStyle createHyperLinkTextStyle() {
    return new TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        decoration: TextDecoration.underline);
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
            child: Center(child: centerText),
          ),
        ));
  }

  Container createRaisedButton(VoidCallback callback, Text centerText) {
    return new Container(
      height: 50,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
        elevation: 7.0,
        color: Colors.green,
        onPressed: callback,
        child: Center(child: centerText),
      ),
    );
  }

  Container createNoContentWidget(String title, String addNewItemButtonTitle, GestureTapCallback callback) {
    return new Container(
      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            createSizedBox(30.0),
            new Icon(Icons.close, size: 220.0, color: Colors.grey,),
            createSizedBox(30.0),
            createText(title, createSimpleLabelTextStyle()),
            createSizedBox(40.0),
            createRaisedButton(callback,
                createText(addNewItemButtonTitle, createButtonTextStyle()))
          ],
        ),
      ),
    );
  }
}
