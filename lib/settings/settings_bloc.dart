import 'package:my_expenses/settings/settings_event.dart';
import 'package:bloc/bloc.dart';
import 'settings_state.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsState> {

  @override
  SettingsState get initialState => InitialSettingsPageState();

  @override
  Stream<SettingsState> mapEventToState(SettingsPageEvent event) async* {
    yield InitialSettingsPageState();
    //todo fill states
  }
}