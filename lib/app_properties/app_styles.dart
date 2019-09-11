import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';

class AppStyles {

  static TextStyle createButtonTextStyle() {
    return new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: AppStrings.montserratFont);
  }

  static TextStyle createHyperLinkTextStyle() {
    return new TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontFamily: AppStrings.montserratFont,
        decoration: TextDecoration.underline);
  }

  static TextStyle createTitleTextStyle() {
    return new TextStyle(fontSize: AppDimens.loginPageTitleFontSize, fontWeight: FontWeight.bold);
  }

  static TextStyle createSubTitleTextStyle() {
    return new TextStyle(fontSize: AppDimens.loginPageSubTitleFontSize, fontWeight: FontWeight.bold);
  }

  static TextStyle createSimpleLabelTextStyle() {
    return new TextStyle(fontSize: AppDimens.simpleTextFontSize, fontWeight: FontWeight.normal);
  }

  static TextStyle createSimpleDataTextStyle() {
    return new TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: AppStrings.montserratFont);
  }

  static TextStyle createCheckboxTextStyle() {
    return new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
  }

  static InputDecoration createTextFieldDecoration(String labelText, String errorText) {
    return new InputDecoration(
        labelText: labelText,
        errorText: errorText,
        labelStyle: TextStyle(
            fontFamily: AppStrings.montserratFont,
            fontWeight: FontWeight.bold,
            color: Colors.grey));
  }
}