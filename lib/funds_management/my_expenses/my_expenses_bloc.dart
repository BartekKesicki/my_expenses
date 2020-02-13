import 'my_expenses_event.dart';
import 'my_expenses_state.dart';
import 'package:bloc/bloc.dart';

class MyExpensesPageBloc extends Bloc<MyExpensesPageEvent, MyExpensesPageState> {

  @override
  MyExpensesPageState get initialState => InitialMyExpensesPageState();

  @override
  Stream<MyExpensesPageState> mapEventToState(MyExpensesPageEvent event) async* {
    yield InitialMyExpensesPageState();
    //todo fill states
  }
}