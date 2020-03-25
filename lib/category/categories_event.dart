import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoriesEvent extends Equatable {
  CategoriesEvent([List props = const []]) : super(props);
}

class InitialCategoriesEvent extends CategoriesEvent { }

class RedirectToIncomeCategoriesEvent extends CategoriesEvent { }

class RedirectToExpenseCategoriesEvent extends CategoriesEvent { }