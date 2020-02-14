import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyIncomesPageEvent extends Equatable {
  MyIncomesPageEvent([List props = const []]) : super(props);
}

class InitialMyIncomesPageEvent extends MyIncomesPageEvent {}