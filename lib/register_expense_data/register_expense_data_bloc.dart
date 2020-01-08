import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/db/helpers/user_database_helper.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_event.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_state.dart';
import 'package:bloc/bloc.dart';

class RegisterExpenseDataBloc extends Bloc<RegisterExpenseDataEvent, RegisterExpenseDataState> {

  @override
  RegisterExpenseDataState get initialState => InitialRegisterExpenseDataState(null, null);

  final _userDb = UserDatabaseHelper();

  @override
  Stream<RegisterExpenseDataState> mapEventToState(RegisterExpenseDataEvent event) async* {
    if (event is BackButtonState) {
      yield BackButtonState();
    } else if (event is SubmitRegisterExpenseDataEvent) {
      final startFundsAreValid = isStartFundsValid(event.startFunds);
      final salaryIsValid = isSalaryValid(event.salary);
      if (startFundsAreValid && salaryIsValid) {
        //todo fix photo url
        double salary = double.parse(event.salary);
        double startFunds = double.parse(event.startFunds);
        double optionalLimit = 0.0;
        if (event.optionalLimit != "") {
          optionalLimit = double.parse(event.optionalLimit);
        }
        User user = User(null, event.model.email, event.model.password, salary, optionalLimit, startFunds, null);
        try {
          await _userDb.saveUser(user);
          yield ResponseRegisterExpenseDataState(true, null);
        } catch(e) {
          yield ResponseRegisterExpenseDataState(false, AppStrings.somethingWentWrong);
        }
      } else if (!startFundsAreValid) {
        yield InitialRegisterExpenseDataState(AppStrings.startFundsIncorrectMessage, null);
      } else if (!salaryIsValid) {
        yield InitialRegisterExpenseDataState(null, AppStrings.salaryIncorrectMessage);
      }
    } else if (event is ValidateRegisterExpenseDataEvent) {
      if (!isStartFundsValid(event.startFunds)) {
        yield InitialRegisterExpenseDataState(AppStrings.startFundsIncorrectMessage, null);
      } else if (!isSalaryValid(event.salary)) {
        yield InitialRegisterExpenseDataState(null, AppStrings.salaryIncorrectMessage);
      }
      yield InitialRegisterExpenseDataState(null, null);
    }
  }

  bool isStartFundsValid(String startFunds) {
    if (startFunds != null) {
      try {
        double value = double.parse(startFunds);
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  bool isSalaryValid(String salary) {
    if (salary != null) {
      try {
        return double.parse(salary) > 0;
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}