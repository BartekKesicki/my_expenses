import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/home_page/home_page_bloc.dart';

import 'home_page_state.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final _homeBloc = HomePageBloc();

  //todo fix behaviour of back button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener(
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
    );
  }

  Widget buildInitialHomePage() {
    return Container();
  }
}