import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FundsManagementPageEvent extends Equatable {
  FundsManagementPageEvent([List props = const []]) : super(props);
}

class InitialFundsManagementEvent extends FundsManagementPageEvent {}