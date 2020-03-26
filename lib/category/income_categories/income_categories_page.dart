import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/category/income_categories/income_categories_bloc.dart';

import 'income_categories_state.dart';

class IncomeCategoriesPage extends StatefulWidget {

  IncomeCategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _IncomeCategoriesPageState();

}

class _IncomeCategoriesPageState extends State<IncomeCategoriesPage> {

  final _incomeCategoriesBloc = IncomeCategoriesPageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _incomeCategoriesBloc,
      listener: (BuildContext context, IncomeCategoriesState incomeCategoriesState) {
        //todo handle to redirect to new category
      },
      child: BlocProvider(
        builder: (BuildContext context) => _incomeCategoriesBloc,
        child: BlocBuilder(
          bloc: _incomeCategoriesBloc,
          builder: (BuildContext context, IncomeCategoriesState incomeCategoriesState) {
            //todo build listview
            return Container();
          },
        ),
      ),
    );
  }

}