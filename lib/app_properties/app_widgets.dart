import 'package:flutter/material.dart';

import 'app_styles.dart';

class AppWidgets {
  static Container createTopLabelsContainer(Text text, EdgeInsets insets) {
    return new Container(
      padding: insets,
      child: text,
    );
  }

  static SizedBox createSizedBox(double height) {
    return new SizedBox(
      height: height,
    );
  }

  static Text createText(String label, TextStyle textStyle) {
    return new Text(
      label,
      style: textStyle,
    );
  }

  static Container createSubmitButton(GestureTapCallback callback, Text centerText) {
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

  static Container createRaisedButton(VoidCallback callback, Text centerText) {
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

  static Container createNoContentWidget(
      String title, String addNewItemButtonTitle, GestureTapCallback callback) {
    return new Container(
      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            createSizedBox(30.0),
            new Icon(
              Icons.close,
              size: 220.0,
              color: Colors.grey,
            ),
            createSizedBox(30.0),
            createText(title, AppStyles.createSimpleLabelTextStyle()),
            createSizedBox(40.0),
            createRaisedButton(callback,
                createText(addNewItemButtonTitle, AppStyles.createButtonTextStyle()))
          ],
        ),
      ),
    );
  }
}