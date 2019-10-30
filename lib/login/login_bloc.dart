import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';

import 'login_event.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  @override
  InitialLoginState get initialState => InitialLoginState(null, null);

  final _userDB = UserDatabaseHelper();
  final login = "flutter.bloc@softwarehut.com";
  final pass = "Password";
  final passwordMinLength = 6;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //todo fix yields
    if (event is SubmitLoginEvent) {
      yield LoginInProgressState();
      final userExists = await _checkCredentials(event.login, event.password);
      if (userExists) {
        yield LoginResponseState(userExists, AppStrings.userAlreadyExists);
      } else {
        yield InitialLoginState(AppStrings.incorrectEmailOrPasswordMessage, null);
      }
    } else if (event is ValidateLoginEvent) {
      final emailIsValid = _validateEmail(event.login);
      final passwordIsValid = _validatePassword(event.password);
      if (emailIsValid && passwordIsValid) {
        yield InitialLoginState(null, null);
      } else if (!emailIsValid && !passwordIsValid) {
        yield InitialLoginState(AppStrings.emailErrorText, AppStrings.passwordErrorText);
      } else if (!emailIsValid) {
        yield InitialLoginState(null, null);
      } else if (!passwordIsValid) {
        yield InitialLoginState(null, AppStrings.passwordErrorText);
      }
    }
  }

  Future<bool> _checkCredentials(String login, String password) {
    //todo check with userdatabase helper
    return Future.delayed(Duration(seconds: 1), () {
      return login == this.login && password == pass;
    });
  }

  bool _validateEmail(String login) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(login);
    return emailValid;
  }

  bool _validatePassword(String password) {
    return password.length > passwordMinLength;
  }
}