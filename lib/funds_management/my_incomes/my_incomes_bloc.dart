import 'package:my_expenses/funds_management/my_incomes/my_incomes_state.dart';
import 'package:bloc/bloc.dart';
import 'my_incomes_event.dart';

class MyIncomesPageBloc extends Bloc<MyIncomesPageEvent, MyIncomesPageState> {

  @override
  MyIncomesPageState get initialState => InitialMyIncomesPageState();

  @override
  Stream<MyIncomesPageState> mapEventToState(MyIncomesPageEvent event) async* {
    yield InitialMyIncomesPageState();
    //todo fill states
  }
}