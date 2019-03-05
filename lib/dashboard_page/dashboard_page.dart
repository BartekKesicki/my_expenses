
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/dashboard_page/dashboard_state_presenter.dart';
import 'package:my_expenses/dashboard_page/dashboard_state_view.dart';

class DashBoardPage extends StatefulWidget {

  DashBoardPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _DashboardPageState();

}

class _DashboardPageState extends BasePageState<DashBoardPage> implements DashboardStateView {

  DashboardStatePresenter presenter;
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  List<CircularStackEntry> data;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    return new Scaffold(
      body: new Center(
          child: new Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: new Column(
              children: <Widget>[
                new AnimatedCircularChart(
                  key: _chartKey,
                  size: const Size(300.0, 300.0),
                  initialChartData: data,
                  chartType: CircularChartType.Radial,
                  percentageValues: true,
                  holeLabel: 'Expenses',
                  labelStyle: new TextStyle(
                    color: Colors.blueGrey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                createSizedBox(30.0),
                createRaisedButton(() {
                  //presenter.performLaunchNewExpense(widget.id);
                }, createText("NEW EXPENSE", createButtonTextStyle())),
              ],
            ),
          )
      ),
    );
  }
  //todo fill the page

  void initPresenter() {
    if (presenter == null) {
      presenter = new DashboardStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

}