import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/categories_page/categories_page.dart';
import 'package:my_expenses/dashboard_page/dashboard_page.dart';
import 'package:my_expenses/fund_management_page/fund_management_page.dart';
import 'package:my_expenses/home/home_state_presenter.dart';
import 'package:my_expenses/home/home_state_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:my_expenses/my_profile_page/profile_page.dart';
import 'package:my_expenses/new_expense_page/new_expense_page.dart';
import 'package:my_expenses/settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> implements HomeStateView {
  List<CircularStackEntry> data;
  HomeStatePresenter presenter;
  PageController _pageController;
  int _page = 2;

  @override
  Widget build(BuildContext context) {
    initHomePresenter();
    return new Scaffold(
      body: new PageView(
        children: <Widget>[
          new FundManagementPage(),
          new ProfilePage(),
          new DashBoardPage(),
          new CategoriesPage(),
          new SettingsPage()
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              backgroundColor: Colors.green,
              title: new Text(
                '',
                style: TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              backgroundColor: Colors.green,
              title: new Text(
                '',
                style: TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              backgroundColor: Colors.green,
              title: new Text(
                '',
                style: TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: Icon(Icons.category),
              backgroundColor: Colors.green,
              title: new Text(
                '',
                style: TextStyle(color: Colors.green),
              )),
          new BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Colors.green,
              title: new Text(
                '',
                style: TextStyle(color: Colors.green),
              )),
        ],
        type: BottomNavigationBarType.shifting,
        onTap: navigationTapped,
      ),
    );
  }

  void initHomePresenter() {
    if (presenter == null) {
      presenter = new HomeStatePresenter();
      presenter.attach(this);
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: AppDimens.animationInMillis), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}
