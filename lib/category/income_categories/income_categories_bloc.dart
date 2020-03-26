import 'income_categories_event.dart';
import 'income_categories_state.dart';
import 'package:bloc/bloc.dart';

class IncomeCategoriesPageBloc extends Bloc<IncomeCategoriesEvent, IncomeCategoriesState> {

  @override
  InitialIncomeCategoriesPageState get initialState => InitialIncomeCategoriesPageState();

  @override
  Stream<IncomeCategoriesState> mapEventToState(IncomeCategoriesEvent event) async* {
    yield InitialIncomeCategoriesPageState();
  }
}