import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FundsManagementPageState extends Equatable {
  FundsManagementPageState([List props = const[]]) : super(props);
}

class InitialFundsManagementPageState extends FundsManagementPageState {}

class FundsManagementSwitchToMyIncomesState extends FundsManagementPageState {}

class FundsManagementSwitchToMyExpensesState extends FundsManagementPageState {}