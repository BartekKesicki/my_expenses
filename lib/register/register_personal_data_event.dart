import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterPersonalDataEvent extends Equatable {
  RegisterPersonalDataEvent([List props = const []]) : super(props);
}

class InitialRegisterPersonalDataEvent extends RegisterPersonalDataEvent { }

class ValidateRegisterPersonalDataEvent extends RegisterPersonalDataEvent { }

class SubmitRegisterPersonalDataEvent extends RegisterPersonalDataEvent { }