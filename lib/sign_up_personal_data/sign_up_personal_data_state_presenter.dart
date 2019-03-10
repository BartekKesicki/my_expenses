import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_state_presenter.dart';
import 'package:my_expenses/base/base_state_view.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_model.dart';
import 'package:my_expenses/sign_up_personal_data/sign_up_personal_data_state_view.dart';

class SignUpPersonalDataStatePresenter extends BaseStatePresenter {
  SignUpPersonalDataStateView view;
  SignUpPersonalDataModel model;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get getFormKey => _formKey;

  @override
  void attach(BaseStateView view) {
    this.view = view;
    model = new SignUpPersonalDataModel();
  }

  void performToMoveToNextPage() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      view.redirectToNextPage(model);
    } else {
      view.autoValidate();
    }
  }

  @override
  void detach() {
    view = null;
  }
}
