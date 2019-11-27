import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/home_page/home_page_bloc.dart';
import 'package:my_expenses/home_page/home_page_event.dart';

import 'home_page_state.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final _homeBloc = HomePageBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocListener(
            listener: (BuildContext context, HomePageState homePageState) {
              if (homePageState is BackButtonState) {
                //do nothing
              }
              //todo redirections
            },
            bloc: _homeBloc,
            child: BlocProvider(
              builder: (BuildContext context) => _homeBloc,
              child: BlocBuilder(
                bloc: _homeBloc,
                builder: (BuildContext context, HomePageState homePageState) {
                  //todo insert other states
                  return buildInitialHomePage();
                },
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget buildInitialHomePage() {
    return Container();
  }

  Future<bool> _onWillPop() async {
    _homeBloc.dispatch(BackButtonEvent());
    return true;
  }
}