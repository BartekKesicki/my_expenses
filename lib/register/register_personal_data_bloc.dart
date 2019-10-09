

import 'package:my_expenses/register/register_personal_data_event.dart';
import 'package:my_expenses/register/register_personal_data_state.dart';
import 'package:bloc/bloc.dart';

class RegisterPersonalDataBloc extends Bloc<RegisterPersonalDataEvent, RegisterPersonalDataState> {

  @override
  InitialRegisterPersonalDataState get initialState => InitialRegisterPersonalDataState(null, null, null);


  @override
  Stream<RegisterPersonalDataState> mapEventToState(RegisterPersonalDataEvent event) async* {
    //todo fix yields
    yield InitialRegisterPersonalDataState(null, null, null);
  }
}