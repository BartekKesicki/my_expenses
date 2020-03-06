import 'funds_management_event.dart';
import 'funds_management_state.dart';
import 'package:bloc/bloc.dart';

class FundsManagementPageBloc extends Bloc<FundsManagementPageEvent, FundsManagementPageState> {

  @override
  InitialFundsManagementPageState get initialState => InitialFundsManagementPageState();

  @override
  Stream<FundsManagementPageState> mapEventToState(FundsManagementPageEvent event) async* {
    if (event is SwitchMyIncomesPageEvent) {
      yield FundsManagementSwitchToMyIncomesState();
    } else if (event is SwitchMyExpensesPageEvent) {
      yield FundsManagementSwitchToMyExpensesState();
    } else {
      yield InitialFundsManagementPageState();
    }
  }
}