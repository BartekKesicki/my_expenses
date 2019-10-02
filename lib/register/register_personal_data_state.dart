import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterPersonalDataState extends Equatable {
  RegisterPersonalDataState([List props = const[]]) : super(props);
}

class InitialRegisterPersonalDataState extends RegisterPersonalDataState {

}
//todo other states