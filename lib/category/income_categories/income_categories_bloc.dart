import 'package:my_expenses/db/helpers/income_category_database_helper.dart';

import 'income_categories_event.dart';
import 'income_categories_state.dart';
import 'package:bloc/bloc.dart';

class IncomeCategoriesPageBloc extends Bloc<IncomeCategoriesEvent, IncomeCategoriesState> {

  @override
  InitialIncomeCategoriesPageState get initialState => InitialIncomeCategoriesPageState(List());

  final _incomeCategoriesDatabaseHelper = IncomeCategoryDatabaseHelper();

  @override
  Stream<IncomeCategoriesState> mapEventToState(IncomeCategoriesEvent event) async* {
    if (event is InitialIncomeCategoriesEvent) {
      final list = await _incomeCategoriesDatabaseHelper.getAllIncomeCategories();
      yield InitialIncomeCategoriesPageState(list);
    } else if (event is RedirectToNewIncomeCategoryEvent) {
      yield RedirectToNewIncomeCategoryPageState();
    }
  }
}