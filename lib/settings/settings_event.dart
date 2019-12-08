import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SettingsPageEvent extends Equatable {
  SettingsPageEvent([List props = const []]) : super(props);
}

class InitialSettingsPageEvent extends SettingsPageEvent { }