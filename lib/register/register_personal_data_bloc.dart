import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/base/base_bloc.dart';
import 'package:my_expenses/register/register_personal_data_validator.dart';
import 'package:rxdart/rxdart.dart';

class RegisterPersonalDataBloc extends Object with RegisterPersonalDataValidator implements BaseBloc {

  final int equalValue = 0;

  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  final BehaviorSubject<String> _confirmPasswordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get confirmPasswordChanged => _confirmPasswordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<String> get confirmPassword => _confirmPasswordController.stream.transform(passwordValidator).doOnData((String c) {
    if (equalValue != _passwordController.value.compareTo(c)) {
      _confirmPasswordController.addError(AppStrings.passwordsAreNotMatch);
    }
  });

  Stream<bool> get registerValid => Observable.combineLatest3(email, password, confirmPassword, (e, p, cp) => true);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();
  }
}