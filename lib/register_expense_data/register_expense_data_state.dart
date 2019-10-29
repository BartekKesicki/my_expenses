import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterExpenseDataState extends Equatable {
  RegisterExpenseDataState([List props = const[]]) : super(props);
}

class InitialRegisterExpenseDataState extends RegisterExpenseDataState {
  final double startFundsErrorMessage;
  final double salaryErrorMessage;
  InitialRegisterExpenseDataState(this.startFundsErrorMessage, this.salaryErrorMessage) : super([startFundsErrorMessage, salaryErrorMessage]);
}

class ValidateRegisterExpenseDataState extends RegisterExpenseDataState {
  final double startFunds;
  final double salary;
  final double optionalLimit;
  ValidateRegisterExpenseDataState(this.startFunds, this.salary, this.optionalLimit) : super([startFunds, salary, optionalLimit]);
}

class RegisterExpenseDataInProgressState extends RegisterExpenseDataState { }

class ResponseRegisterExpenseDataState extends RegisterExpenseDataState {
  final bool isRegistered;
  final String optionalMessage;
  ResponseRegisterExpenseDataState(this.isRegistered, this.optionalMessage) : super([isRegistered, optionalMessage]);
}