import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterExpenseDataEvent extends Equatable {
  RegisterExpenseDataEvent([List props = const []]) : super(props);
}

class InitialRegisterPersonalDataEvent extends RegisterExpenseDataEvent { }

class ValidateRegisterPersonalDataEvent extends RegisterExpenseDataEvent {

  //todo fill fields
}

class SubmitRegisterPersonalDataEvent extends RegisterExpenseDataEvent {
  //todo fill fields
}