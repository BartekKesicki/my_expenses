import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoriesState extends Equatable {
  CategoriesState([List props = const[]]) : super(props);
}

class InitialCategoriesPageState extends CategoriesState { }

class RedirectToIncomeCategoriesState extends CategoriesState { }

class RedirectToExpenseCategoriesState extends CategoriesState { }