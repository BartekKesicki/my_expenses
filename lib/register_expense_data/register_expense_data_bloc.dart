import 'package:my_expenses/register_expense_data/register_expense_data_event.dart';
import 'package:my_expenses/register_expense_data/register_expense_data_state.dart';
import 'package:bloc/bloc.dart';

class RegisterExpenseDataBloc extends Bloc<RegisterExpenseDataEvent, RegisterExpenseDataState> {

  @override
  RegisterExpenseDataState get initialState => InitialRegisterExpenseDataState(null, null);

  @override
  Stream<RegisterExpenseDataState> mapEventToState(RegisterExpenseDataEvent event) async* {
    if (event is SubmitRegisterExpenseDataEvent) {
      //todo submit button
    } else if (event is ValidateRegisterExpenseDataEvent) {
      //todo validate form
    }
  }
}