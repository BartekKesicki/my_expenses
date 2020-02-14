import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyIncomesPageState extends Equatable {
  MyIncomesPageState([List props = const[]]) : super(props);
}

class InitialMyIncomesPageState extends MyIncomesPageState {}