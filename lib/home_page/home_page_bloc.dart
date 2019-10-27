import 'package:my_expenses/home_page/home_page_event.dart';
import 'package:my_expenses/home_page/home_page_state.dart';
import 'package:bloc/bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  @override
  InitialHomePageState get initialState => InitialHomePageState();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    yield InitialHomePageState();
    //todo fill states
  }

}