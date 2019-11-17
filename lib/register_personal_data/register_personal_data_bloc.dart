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
    if (event is SubmitRegisterPersonalDataEvent) {
      final userIsValid = await _userIsValid(event.email, event.password);
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
      } else if (userIsValid) {
        RegisterPersonalDataModel model =
            RegisterPersonalDataModel(event.email, event.password);
        yield ResponseRegisterPersonalDataState(true, null, model);
      } else if (!userIsValid) {
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

  Future<bool> _userIsValid(String email, String password) async {
    int idUser = await _userDb.getUserIdOrNull(email, password);
    return idUser == null;
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
