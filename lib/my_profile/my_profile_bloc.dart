import 'my_profile_event.dart';
import 'my_profile_state.dart';
import 'package:bloc/bloc.dart';

class MyProfilePageBloc extends Bloc<MyProfileEvent, MyProfileState> {

  @override
  InitialMyProfileState get initialState => InitialMyProfileState();

  @override
  Stream<MyProfileState> mapEventToState(MyProfileEvent event) async* {
    yield InitialMyProfileState();
  }
}