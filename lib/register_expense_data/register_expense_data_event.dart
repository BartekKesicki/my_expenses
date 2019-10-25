import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterExpenseDataEvent extends Equatable {
  RegisterExpenseDataEvent([List props = const []]) : super(props);
}

class InitialRegisterPersonalDataEvent extends RegisterExpenseDataEvent { }

class ValidateRegisterPersonalDataEvent extends RegisterExpenseDataEvent {
  final double startFunds;
  final double salary;
  ValidateRegisterPersonalDataEvent(this.startFunds, this.salary) : super([startFunds, salary]);
}

class SubmitRegisterPersonalDataEvent extends RegisterExpenseDataEvent {
  final double startFunds;
  final double salary;
  final double optionalLimit;
  SubmitRegisterPersonalDataEvent(this.startFunds, this.salary, this.optionalLimit) : super([startFunds, salary, optionalLimit]);
}