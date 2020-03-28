import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses/db/model/income_category.dart';

@immutable
abstract class IncomeCategoriesState extends Equatable {
  IncomeCategoriesState([List props = const[]]) : super(props);
}

class InitialIncomeCategoriesPageState extends IncomeCategoriesState {
  final List<IncomeCategory> incomeCategories;

  InitialIncomeCategoriesPageState(this.incomeCategories);
}

class RedirectToNewIncomeCategoryPageState extends IncomeCategoriesState { }