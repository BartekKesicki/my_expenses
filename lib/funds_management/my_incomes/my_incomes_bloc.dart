import 'package:my_expenses/db/helpers/income_database_helper.dart';
import 'package:my_expenses/funds_management/my_incomes/my_incomes_state.dart';
import 'package:bloc/bloc.dart';
import 'my_incomes_event.dart';

class MyIncomesPageBloc extends Bloc<MyIncomesPageEvent, MyIncomesPageState> {

  @override
  MyIncomesPageState get initialState => InitialMyIncomesPageState(List());

  final _incomeDatabaseHelper = IncomeDatabaseHelper();

  @override
  Stream<MyIncomesPageState> mapEventToState(MyIncomesPageEvent event) async* {
    if (event is InitialMyIncomesPageEvent && event.keyWord.isEmpty ) {
      final list = await _incomeDatabaseHelper.getAllIncomes();
      yield InitialMyIncomesPageState(list);
    } else {
      yield InitialMyIncomesPageState(List());
    }
  }
}