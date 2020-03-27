import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ExpenseCategoriesEvent extends Equatable {
  ExpenseCategoriesEvent([List props = const []]) : super(props);
}

class InitialExpenseCategoriesEvent extends ExpenseCategoriesEvent { }