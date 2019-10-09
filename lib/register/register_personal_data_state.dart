import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterPersonalDataState extends Equatable {
  RegisterPersonalDataState([List props = const[]]) : super(props);
}

class InitialRegisterPersonalDataState extends RegisterPersonalDataState {
  final String usernameErrorMessage;
  final String passwordErrorMessage;
  final String confirmPasswordErrorMessage;
  InitialRegisterPersonalDataState(this.usernameErrorMessage, this.passwordErrorMessage, this.confirmPasswordErrorMessage) : super([usernameErrorMessage, passwordErrorMessage, confirmPasswordErrorMessage]);
}

class ValidateRegisterPersonalDataState extends RegisterPersonalDataState {
  final String username;
  final String password;
  final String confirmPassword;
  ValidateRegisterPersonalDataState(this.username, this.password, this.confirmPassword) : super([username, password, confirmPassword]);
}

class RegisterPersonalDataInProgressState extends RegisterPersonalDataState { }

class ResponseRegisterPersonalDataState extends RegisterPersonalDataState {
    final bool isValid;
    final String optionalMessage;
    ResponseRegisterPersonalDataState(this.isValid, this.optionalMessage) : super([isValid, optionalMessage]);
}