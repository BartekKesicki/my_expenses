import 'funds_management_event.dart';
import 'funds_management_state.dart';
import 'package:bloc/bloc.dart';

class FundsManagementPageBloc extends Bloc<FundsManagementPageEvent, FundsManagementPageState> {

  @override
  InitialFundsManagementPageState get initialState => InitialFundsManagementPageState();

  @override
  Stream<FundsManagementPageState> mapEventToState(FundsManagementPageEvent event) async* {
    yield InitialFundsManagementPageState();
  }
}