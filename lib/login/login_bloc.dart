import 'dart:async';

import 'package:my_expenses/base/base_bloc.dart';
import 'package:my_expenses/login/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with LoginValidator implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  StreamSink<String> get emailChanged => _emailController.sink;
  StreamSink<String> get passwordChanged => _passwordController.sink;


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    print("xyz");
    //todo check DB
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}