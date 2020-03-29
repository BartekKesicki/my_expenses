import 'package:my_expenses/db/helpers/expense_category_database_helper.dart';

import 'expense_categories_event.dart';
import 'expense_categories_state.dart';
import 'package:bloc/bloc.dart';

class ExpenseCategoriesPageBloc extends Bloc<ExpenseCategoriesEvent, ExpenseCategoriesState> {

  @override
  InitialExpenseCategoriesPageState get initialState => InitialExpenseCategoriesPageState(List());

  final _expenseCategoryDatabaseHelper = ExpenseCategoryDatabaseHelper();

  @override
  Stream<ExpenseCategoriesState> mapEventToState(ExpenseCategoriesEvent event) async* {
    if (event is InitialExpenseCategoriesEvent) {
      final list = await _expenseCategoryDatabaseHelper.getAllExpenseCategories();
      yield InitialExpenseCategoriesPageState(list);
    } else if (event is RedirectToNewExpenseCategoryEvent) {
      yield RedirectToNewExpenseCategoryPageState();
    }

  }
}