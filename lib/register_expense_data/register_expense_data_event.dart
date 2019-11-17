import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses/model/register_personal_data_model.dart';

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
  final RegisterPersonalDataModel model;
  SubmitRegisterExpenseDataEvent(this.startFunds, this.salary, this.optionalLimit, this.model) : super([startFunds, salary, optionalLimit, model]);
}