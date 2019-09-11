import 'package:my_expenses/base/base_bloc.dart';
import 'package:my_expenses/login/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with LoginValidator implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    //todo check DB
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}