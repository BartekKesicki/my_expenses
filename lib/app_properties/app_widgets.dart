import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';

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

  static Widget createAppButton(GestureTapCallback callback, Text centerText) {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.containerSideMargin, right: AppDimens.containerSideMargin),
      child: Container(
          height: AppDimens.appRaisedButtonHeight,
          child: Material(
            borderRadius: BorderRadius.circular(AppDimens.appRaisedButtonCornerRadius),
            shadowColor: Colors.lightGreen,
            color: Colors.green,
            elevation: AppDimens.appRaisedButtonElevation,
            child: GestureDetector(
              onTap: callback,
              child: Center(child: centerText),
            ),
          )),
    );
  }

  static Container createRaisedButton(VoidCallback callback, Text centerText) {
    return new Container(
      height: AppDimens.appRaisedButtonHeight,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(AppDimens.appRaisedButtonCornerRadius)),
        elevation: AppDimens.appRaisedButtonElevation,
        color: Colors.green,
        onPressed: callback,
        child: Center(child: centerText),
      ),
    );
  }

  static Container createNoContentWidget(
      String title, String addNewItemButtonTitle, GestureTapCallback callback) {
    return new Container(
      margin: EdgeInsets.only(top: AppDimens.noContentTopPadding, left: AppDimens.noContentPaddingSide, right: AppDimens.noContentPaddingSide),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(
              Icons.close,
              size: AppDimens.noContentImageSize,
              color: Colors.grey,
            ),
            createText(title, AppStyles.createSimpleLabelTextStyle()),
            createRaisedButton(callback,
                createText(addNewItemButtonTitle, AppStyles.createButtonTextStyle()))
          ],
        ),
      ),
    );
  }

  static AlertDialog createAlertDialog(BuildContext context, String message, String positiveText, String negativeText, VoidCallback onPositivePressed, VoidCallback onNegativePressed) {
    return AlertDialog(
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(positiveText),
          onPressed: onPositivePressed,
        ),
        FlatButton(
          child: Text(negativeText),
          onPressed: onNegativePressed,
        )
      ],
    );
  }
}