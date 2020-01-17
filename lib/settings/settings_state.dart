import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SettingsState extends Equatable {
  SettingsState([List props = const[]]) : super(props);
}

class InitialSettingsPageState extends SettingsState { }

class LogoutPageState extends SettingsState { }