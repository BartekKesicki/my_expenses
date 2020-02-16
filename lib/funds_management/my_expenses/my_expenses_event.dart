import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyExpensesPageEvent extends Equatable {
  MyExpensesPageEvent([List props = const []]) : super(props);
}

class InitialMyExpensesPageEvent extends MyExpensesPageEvent {
  final String keyWord;
  InitialMyExpensesPageEvent(this.keyWord) : super([keyWord]);
}