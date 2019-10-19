import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterExpenseDataState extends Equatable {
  RegisterExpenseDataState([List props = const[]]) : super(props);
}

class InitialRegisterExpenseDataState extends RegisterExpenseDataState {
  //todo fill data for initial state
}

class ValidateRegisterPersonalDataState extends RegisterExpenseDataState {

}

class RegisterPersonalDataInProgressState extends RegisterExpenseDataState { }

class ResponseRegisterPersonalDataState extends RegisterExpenseDataState {
  //todo fill data for state
}