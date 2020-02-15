import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses/db/model/income.dart';

@immutable
abstract class MyIncomesPageState extends Equatable {
  MyIncomesPageState([List props = const[]]) : super(props);
}

class InitialMyIncomesPageState extends MyIncomesPageState {
  final List<Income> incomes;

  InitialMyIncomesPageState(this.incomes) : super([incomes]);
}