import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  HomePageEvent([List props = const []]) : super(props);
}