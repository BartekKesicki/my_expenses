import 'package:my_expenses/db/helpers/shared_preferences_helper.dart';
import 'package:my_expenses/settings/settings_event.dart';
import 'package:bloc/bloc.dart';
import 'settings_state.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsState> {

  @override
  SettingsState get initialState => InitialSettingsPageState();

  final sharedPrefs = SharedPreferencesHelper();

  @override
  Stream<SettingsState> mapEventToState(SettingsPageEvent event) async* {
    if (event is PerformLogoutEvent) {
      await sharedPrefs.logout();
      yield LogoutPageState();
    } else {
      yield InitialSettingsPageState();
    }
  }
}