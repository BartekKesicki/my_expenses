import 'package:my_expenses/home_page/home_page_event.dart';
import 'package:my_expenses/home_page/home_page_state.dart';
import 'package:bloc/bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  @override
  InitialHomePageState get initialState => InitialHomePageState();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is InitialHomePageEvent) {
      yield InitialHomePageState();
    } else if (event is RedirectToSettingsPageEvent) {
      yield RedirectToSettingsPageState();
    } else if (event is RedirectToCategoriesPageEvent) {
      yield RedirectToCategoriesPageState();
    } else if (event is RedirectToFundsManagementPageEvent) {
      yield RedirectToFundsManagementPageState();
    } else if (event is RedirectToMyProfilePageEvent) {
      yield RedirectToMyProfilePageState();
    }
    yield InitialHomePageState();
  }
}