import 'package:my_expenses/db/helpers/expense_database_helper.dart';

import 'my_expenses_event.dart';
import 'my_expenses_state.dart';
import 'package:bloc/bloc.dart';

class MyExpensesPageBloc extends Bloc<MyExpensesPageEvent, MyExpensesPageState> {

  @override
  MyExpensesPageState get initialState => InitialMyExpensesPageState(List());

  final _expenseDataBaseHelper = ExpenseDatabaseHelper();

  @override
  Stream<MyExpensesPageState> mapEventToState(MyExpensesPageEvent event) async* {
    if (event is InitialMyExpensesPageEvent && event.keyWord.isEmpty ) {
      final list = await _expenseDataBaseHelper.getAllExpenses();
      yield InitialMyExpensesPageState(list);
    } else {
      yield InitialMyExpensesPageState(List());
    }
  }
}