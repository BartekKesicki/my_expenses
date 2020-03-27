import 'expense_categories_event.dart';
import 'expense_categories_state.dart';
import 'package:bloc/bloc.dart';

class ExpenseCategoriesPageBloc extends Bloc<ExpenseCategoriesEvent, ExpenseCategoriesState> {

  @override
  InitialExpenseCategoriesPageState get initialState => InitialExpenseCategoriesPageState();

  @override
  Stream<ExpenseCategoriesState> mapEventToState(ExpenseCategoriesEvent event) async* {
    yield InitialExpenseCategoriesPageState();
  }
}