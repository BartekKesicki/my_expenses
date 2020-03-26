import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IncomeCategoriesEvent extends Equatable {
  IncomeCategoriesEvent([List props = const []]) : super(props);
}

class InitialIncomeCategoriesEvent extends IncomeCategoriesEvent { }