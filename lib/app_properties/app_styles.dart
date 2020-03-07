import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';

class AppStyles {

  static TextStyle createButtonTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: AppStrings.montserratFont);
  }

  static TextStyle createHyperLinkTextStyle() {
    return TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontFamily: AppStrings.montserratFont,
        decoration: TextDecoration.underline);
  }

  static TextStyle createTitleTextStyle() {
    return TextStyle(fontSize: AppDimens.loginPageTitleFontSize, fontWeight: FontWeight.bold);
  }

  static TextStyle createSubTitleTextStyle() {
    return TextStyle(fontSize: AppDimens.loginPageSubTitleFontSize, fontWeight: FontWeight.bold);
  }

  static TextStyle createSimpleLabelTextStyle() {
    return TextStyle(fontSize: AppDimens.simpleTextFontSize, fontWeight: FontWeight.normal);
  }

  static TextStyle createSimpleDataTextStyle() {
    return TextStyle(
        fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: AppStrings.montserratFont);
  }

  static TextStyle createCheckboxTextStyle() {
    return TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
  }

  static InputDecoration createTextFieldDecoration(String labelText, String errorText) {
    return InputDecoration(
        labelText: labelText,
        errorText: errorText,
        labelStyle: _createInputDecorationTextStyle()
    );
  }

  static InputDecoration createSearchBarTextFieldDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(Icons.search),
      border: _createBlackInputBorder(),
      enabledBorder: _createBlackInputBorder(),
      disabledBorder: _createBlackInputBorder(),
      labelStyle: _createInputDecorationTextStyle()
    );
  }

  static OutlineInputBorder _createBlackInputBorder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(AppDimens.searchBarRadius),
        ),
        borderSide: BorderSide(width: AppDimens.searchBarBorderWidth ,color: Colors.black)
    );
  }

  static TextStyle _createInputDecorationTextStyle() {
    return TextStyle(
        fontFamily: AppStrings.montserratFont,
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }
}