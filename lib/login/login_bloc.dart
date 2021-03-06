import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';

import 'login_event.dart';
import 'login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  @override
  InitialLoginState get initialState => InitialLoginState(null, null);

  final _userDB = UserDatabaseHelper();
  final passwordMinLength = 6;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is BackButtonState) {
      yield BackButtonState();
    } else if (event is SubmitLoginEvent) {
      yield LoginInProgressState();
      final userExists = await _checkCredentials(event.login, event.password);
      if (userExists) {
        yield LoginResponseState(userExists, AppStrings.userAlreadyExists);
      } else {
        yield InitialLoginState(AppStrings.incorrectEmailOrPasswordMessage, null);
      }
    } else if (event is ValidateLoginEvent) {
      //todo optional validation
    } else if (event is RedirectToRegisterPageEvent) {
      yield RedirectToRegisterPageState();
    }
  }

  Future<bool> _checkCredentials(String login, String password) async {
    bool isExists = await _userDB.isUserExists(login, password);
    return isExists;
  }
}