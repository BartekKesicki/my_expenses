import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterExpenseDataState extends Equatable {
  RegisterExpenseDataState([List props = const[]]) : super(props);
}

class InitialRegisterExpenseDataState extends RegisterExpenseDataState {
  final double startFunds;
  final double salary;
  final double optionalLimit;
  InitialRegisterExpenseDataState(this.startFunds, this.salary, this.optionalLimit) : super([startFunds, salary, optionalLimit]);
}

class ValidateRegisterExpenseDataState extends RegisterExpenseDataState {
  final double startFunds;
  final double salary;
  final double optionalLimit;
  ValidateRegisterExpenseDataState(this.startFunds, this.salary, this.optionalLimit) : super([startFunds, salary, optionalLimit]);
}

class RegisterPersonalDataInProgressState extends RegisterExpenseDataState { }

class ResponseRegisterPersonalDataState extends RegisterExpenseDataState {
  final bool isRegistered;
  final String optionalMessage;
  ResponseRegisterPersonalDataState(this.isRegistered, this.optionalMessage) : super([isRegistered, optionalMessage]);
}