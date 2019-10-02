import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class SubmitLoginEvent extends LoginEvent {
  final String login;
  final String password;

  SubmitLoginEvent([this.login, this.password]) : super([login, password]);
}

class ValidateLoginEvent extends LoginEvent {
  final String login;
  final String password;

  ValidateLoginEvent([this.login, this.password]) : super([login, password]);
}