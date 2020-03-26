import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IncomeCategoriesState extends Equatable {
  IncomeCategoriesState([List props = const[]]) : super(props);
}

class InitialIncomeCategoriesPageState extends IncomeCategoriesState { }