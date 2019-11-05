import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterExpenseDataEvent extends Equatable {
  RegisterExpenseDataEvent([List props = const []]) : super(props);
}

class InitialRegisterExpenseDataEvent extends RegisterExpenseDataEvent { }

class ValidateRegisterExpenseDataEvent extends RegisterExpenseDataEvent {
  final String startFunds;
  final String salary;
  ValidateRegisterExpenseDataEvent(this.startFunds, this.salary) : super([startFunds, salary]);
}

class SubmitRegisterExpenseDataEvent extends RegisterExpenseDataEvent {
  final String startFunds;
  final String salary;
  final String optionalLimit;
  SubmitRegisterExpenseDataEvent(this.startFunds, this.salary, this.optionalLimit) : super([startFunds, salary, optionalLimit]);
}