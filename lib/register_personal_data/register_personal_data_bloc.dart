import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
import 'package:my_expenses/model/register_personal_data_model.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_event.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_state.dart';
import 'package:bloc/bloc.dart';

class RegisterPersonalDataBloc
    extends Bloc<RegisterPersonalDataEvent, RegisterPersonalDataState> {
  @override
  InitialRegisterPersonalDataState get initialState =>
      InitialRegisterPersonalDataState(null, null, null);

  final _userDb = UserDatabaseHelper();
  final passwordMinLength = 6;

  @override
  Stream<RegisterPersonalDataState> mapEventToState(
      RegisterPersonalDataEvent event) async* {
    if (event is BackButtonState) {
      yield BackButtonState();
    } else if (event is SubmitRegisterPersonalDataEvent) {
      final userExists = await _userIsExists(event.email, event.password);
      final emailIsValid = _validateEmail(event.email);
      final passwordIsValid = _validatePassword(event.password);
      final passwordsAreEqual = event.password == event.confirmPassword;
      if (!emailIsValid) {
        yield InitialRegisterPersonalDataState(
            AppStrings.emailIsNotValid, null, null);
      } else if (!passwordIsValid) {
        yield InitialRegisterPersonalDataState(
            null, AppStrings.incorrectPassword, null);
      } else if (!passwordsAreEqual) {
        yield InitialRegisterPersonalDataState(
            null, null, AppStrings.passwordsAreNotMatch);
      } else if (!userExists) {
        RegisterPersonalDataModel model =
            RegisterPersonalDataModel(event.email, event.password);
        yield ResponseRegisterPersonalDataState(true, null, model);
      } else if (userExists) {
        yield InitialRegisterPersonalDataState(
            AppStrings.userAlreadyExists, null, null);
      }
    } else if (event is ValidateRegisterPersonalDataEvent) {
      final emailIsValid = _validateEmail(event.email);
      final passwordIsValid = _validatePassword(event.password);
      final passwordsAreEqual =
          passwordIsValid && event.password == event.confirmPassword;
      if (emailIsValid && passwordIsValid && passwordsAreEqual) {
        yield InitialRegisterPersonalDataState(null, null, null);
      } else if (!emailIsValid) {
        yield InitialRegisterPersonalDataState(
            AppStrings.emailIsNotValid, null, null);
      } else if (!passwordIsValid) {
        yield InitialRegisterPersonalDataState(
            null, AppStrings.incorrectPassword, null);
      } else if (!passwordsAreEqual) {
        yield InitialRegisterPersonalDataState(
            null, null, AppStrings.passwordsAreNotMatch);
      } else {
        yield InitialRegisterPersonalDataState(null, null, null);
      }
    }
  }

  Future<bool> _userIsExists(String email, String password) async {
    return await _userDb.isUserExists(email, password);
  }

  bool _validateEmail(String login) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(login);
    return emailValid;
  }

  bool _validatePassword(String password) {
    return password.length > passwordMinLength;
  }
}
