import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses/db/model/expense_category.dart';

@immutable
abstract class ExpenseCategoriesState extends Equatable {
  ExpenseCategoriesState([List props = const[]]) : super(props);
}

class InitialExpenseCategoriesPageState extends ExpenseCategoriesState {
  final List<ExpenseCategory> expenseCategories;

  InitialExpenseCategoriesPageState(this.expenseCategories);
}

class RedirectToNewExpenseCategoryPageState extends ExpenseCategoriesState { }