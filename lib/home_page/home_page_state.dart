import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomePageState extends Equatable {
  HomePageState([List props = const[]]) : super(props);
}

class InitialHomePageState extends HomePageState {}