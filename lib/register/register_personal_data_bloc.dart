import 'package:my_expenses/base/base_bloc.dart';
import 'package:my_expenses/register/register_personal_data_validator.dart';
import 'package:rxdart/rxdart.dart';

class RegisterPersonalDataBloc extends Object with RegisterPersonalDataValidator implements BaseBloc {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get confirmPasswordChanged => _confirmPasswordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<String> get confirmPassword => _confirmPasswordController.stream.transform(confirmPasswordValidator);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();
  }
}