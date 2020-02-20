import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses/db/model/expense.dart';

@immutable
abstract class MyExpensesPageState extends Equatable {
  MyExpensesPageState([List props = const[]]) : super(props);
}

class InitialMyExpensesPageState extends MyExpensesPageState {
  final List<Expense> expenses;

  InitialMyExpensesPageState(this.expenses) : super([expenses]);
}

class RedirectToNewExpensePageState extends MyExpensesPageState { }