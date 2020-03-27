import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ExpenseCategoriesState extends Equatable {
  ExpenseCategoriesState([List props = const[]]) : super(props);
}

class InitialExpenseCategoriesPageState extends ExpenseCategoriesState { }