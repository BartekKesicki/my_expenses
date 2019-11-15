import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses/model/register_personal_data_model.dart';

@immutable
abstract class RegisterPersonalDataState extends Equatable {
  RegisterPersonalDataState([List props = const []]) : super(props);
}

class InitialRegisterPersonalDataState extends RegisterPersonalDataState {
  final String usernameErrorMessage;
  final String passwordErrorMessage;
  final String confirmPasswordErrorMessage;
  InitialRegisterPersonalDataState(
      [this.usernameErrorMessage,
      this.passwordErrorMessage,
      this.confirmPasswordErrorMessage])
      : super([
          usernameErrorMessage,
          passwordErrorMessage,
          confirmPasswordErrorMessage
        ]);
}

class RegisterPersonalDataInProgressState extends RegisterPersonalDataState {}

class ResponseRegisterPersonalDataState extends RegisterPersonalDataState {
  final bool isValid;
  final String optionalMessage;
  final RegisterPersonalDataModel model;
  ResponseRegisterPersonalDataState(
      this.isValid, this.optionalMessage, this.model)
      : super([isValid, optionalMessage, model]);
}
