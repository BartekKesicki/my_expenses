import 'categories_event.dart';
import 'categories_state.dart';
import 'package:bloc/bloc.dart';

class CategoriesPageBloc extends Bloc<CategoriesEvent, CategoriesState> {

  @override
  InitialCategoriesPageState get initialState => InitialCategoriesPageState();

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    yield InitialCategoriesPageState();
  }
}