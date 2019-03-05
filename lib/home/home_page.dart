import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/home/home_state_presenter.dart';
import 'package:my_expenses/home/home_state_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class HomePage extends StatefulWidget {
  HomePage(this.id, {Key key, this.title}) : super(key: key);

  final int id;
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> implements HomeStateView {

  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  List<CircularStackEntry> data;
  HomeStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    prepareChartData();
    initHomePresenter();
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
                presenter.performLaunchNewExpense(widget.id);
              }, createText("NEW EXPENSE", createButtonTextStyle())),
            ],
          ),
        )
      ),
      //todo fix icons
      bottomNavigationBar: BottomNavigationBar(currentIndex: 2 , items: [
        new BottomNavigationBarItem(icon: Icon(Icons.attach_money), backgroundColor: Colors.green, title: new Text('', style: TextStyle(color: Colors.green),)),
        new BottomNavigationBarItem(icon: Icon(Icons.account_circle), backgroundColor: Colors.green, title: new Text('', style: TextStyle(color: Colors.green),)),
        new BottomNavigationBarItem(icon: Icon(Icons.dashboard), backgroundColor: Colors.green, title: new Text('', style: TextStyle(color: Colors.green),)),
        new BottomNavigationBarItem(icon: Icon(Icons.category), backgroundColor: Colors.green, title: new Text('', style: TextStyle(color: Colors.green),)),
        new BottomNavigationBarItem(icon: Icon(Icons.settings), backgroundColor: Colors.green, title: new Text('', style: TextStyle(color: Colors.green),)),
      ], type: BottomNavigationBarType.shifting,),
    );
  }

  void prepareChartData() {
     data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(5.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(20.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(40.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(35.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
  }

  void initHomePresenter() {
    if (presenter == null) {
      presenter = new HomeStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  @override
  void redirectToAddNewExpensePage(int userId) {
    // TODO: implement redirectToAddNewExpensePage
  }
}