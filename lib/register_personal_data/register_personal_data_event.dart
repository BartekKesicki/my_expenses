import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterPersonalDataEvent extends Equatable {
  RegisterPersonalDataEvent([List props = const []]) : super(props);
}

class InitialRegisterPersonalDataEvent extends RegisterPersonalDataEvent { }

class ValidateRegisterPersonalDataEvent extends RegisterPersonalDataEvent {
  final String email;
  final String password;
  final String confirmPassword;
  ValidateRegisterPersonalDataEvent(this.email, this.password, this.confirmPassword) : super([email, password, confirmPassword]);
}

class SubmitRegisterPersonalDataEvent extends RegisterPersonalDataEvent {
  final String email;
  final String password;
  final String confirmPassword;
  SubmitRegisterPersonalDataEvent(this.email, this.password, this.confirmPassword) : super([email, password, confirmPassword]);
}