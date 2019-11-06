import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_event.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_state.dart';
import 'package:bloc/bloc.dart';

class RegisterPersonalDataBloc extends Bloc<RegisterPersonalDataEvent, RegisterPersonalDataState> {

  @override
  InitialRegisterPersonalDataState get initialState => InitialRegisterPersonalDataState(null, null, null);

  final _userDb = UserDatabaseHelper();
  final passwordMinLength = 6;

  @override
  Stream<RegisterPersonalDataState> mapEventToState(RegisterPersonalDataEvent event) async* {
    if (event is SubmitRegisterPersonalDataEvent) {
      bool userIsValid = await _userIsValid(event.email, event.password);
      bool emailIsValid = _validateEmail(event.email);
      bool passwordIsValid = _validatePassword(event.password);
      bool passwordsAreEqual = event.password == event.confirmPassword;
      if (!emailIsValid) {
        yield InitialRegisterPersonalDataState(AppStrings.emailIsNotValid, null, null);
      } else if (!passwordIsValid) {
        yield InitialRegisterPersonalDataState(null, AppStrings.incorrectPassword, null);
      } else if (!passwordsAreEqual) {
        yield InitialRegisterPersonalDataState(null, null, AppStrings.passwordsAreNotMatch);
      } else if (userIsValid) {
        //todo pass user to next page
      } else if (!userIsValid) {
        yield InitialRegisterPersonalDataState(AppStrings.userAlreadyExists, null, null);
      }
    } else if (event is ValidateRegisterPersonalDataEvent) {
      bool emailIsValid = _validateEmail(event.email);
      bool passwordIsValid = _validatePassword(event.password);
      bool passwordsAreEqual = event.password == event.confirmPassword;
      if (!emailIsValid) {
        yield InitialRegisterPersonalDataState(AppStrings.emailIsNotValid, null, null);
      } else if (!passwordIsValid) {
        yield InitialRegisterPersonalDataState(null, AppStrings.incorrectPassword, null);
      }
      else if (!passwordsAreEqual) {
        yield InitialRegisterPersonalDataState(null, null, AppStrings.passwordsAreNotMatch);
      }
    }
  }

  Future<bool> _userIsValid(String email, String password) async {
    int idUser = await _userDb.getUserIdOrNull(email, password);
    return idUser == null;
  }

  bool _validateEmail(String login) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(login);
    return emailValid;
  }

  bool _validatePassword(String password) {
    return password.length > passwordMinLength;
  }
}