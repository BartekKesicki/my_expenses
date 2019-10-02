
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const[]]) : super(props);
}

class InitialLoginState extends LoginState {
  final String usernameErrorMessage;
  final String passwordErrorMessage;
  InitialLoginState(this.usernameErrorMessage, this.passwordErrorMessage) : super([usernameErrorMessage, passwordErrorMessage]);
}

class LoginInProgressState extends LoginState { }

class RedirectToRegisterPageState extends LoginState { }

class LoginResponseState extends LoginState {
  final bool response;
  LoginResponseState(this.response) : super([response]);
}