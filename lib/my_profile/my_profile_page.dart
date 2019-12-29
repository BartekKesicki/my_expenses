import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/my_profile/my_profile_bloc.dart';
import 'package:my_expenses/my_profile/my_profile_state.dart';

class MyProfilePage extends StatefulWidget {

  MyProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MyProfilePageState();

}

class _MyProfilePageState extends State<MyProfilePage> {

  final _myProfileBloc = MyProfilePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => _myProfileBloc,
        child: BlocBuilder(
          bloc: _myProfileBloc,
          builder : (BuildContext context, MyProfileState myProfileState) {
            //todo fill with other states
            return Container();
          }
        ),
      ),
    );
  }

}