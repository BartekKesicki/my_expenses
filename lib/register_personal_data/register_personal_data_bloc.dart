import 'package:my_expenses/register_personal_data/register_personal_data_event.dart';
import 'package:my_expenses/register_personal_data/register_personal_data_state.dart';
import 'package:bloc/bloc.dart';

class RegisterPersonalDataBloc extends Bloc<RegisterPersonalDataEvent, RegisterPersonalDataState> {

  @override
  InitialRegisterPersonalDataState get initialState => InitialRegisterPersonalDataState(null, null, null);

  //todo dbhelper

  @override
  Stream<RegisterPersonalDataState> mapEventToState(RegisterPersonalDataEvent event) async* {
    if (event is ValidateRegisterPersonalDataEvent) {
      //todo validation
    } else if (event is SubmitRegisterPersonalDataEvent) {
      //todo submit
    }
  }
}