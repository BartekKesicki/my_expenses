import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/category/categories_page.dart';
import 'package:my_expenses/funds_management/funds_management_page.dart';
import 'package:my_expenses/home_page/home_page_action.dart';
import 'package:my_expenses/home_page/home_page_bloc.dart';
import 'package:my_expenses/home_page/home_page_event.dart';
import 'package:my_expenses/home_page/home_page_type.dart';
import 'package:my_expenses/login/login_page.dart';
import 'package:my_expenses/my_profile/my_profile_page.dart';
import 'package:my_expenses/settings/settings_page.dart';

import 'home_page_state.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> implements HomePageAction {

  static int selectedPos = 2;
  CircularBottomNavigationController _navigationController = CircularBottomNavigationController(selectedPos);

  List<TabItem> tabItems = List.of([
    TabItem(Icons.assessment, AppStrings.fundsManagement, Colors.green, labelStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
    TabItem(Icons.person, AppStrings.myProfile, Colors.green, labelStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
    TabItem(Icons.home, AppStrings.dashboard, Colors.green, labelStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
    TabItem(Icons.category, AppStrings.categories, Colors.green, labelStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, AppStrings.settingsPage, Colors.green, labelStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
  ]);

  final _homeBloc = HomePageBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: Container(
            child: BlocProvider(
              builder: (BuildContext context) => _homeBloc,
              child: BlocBuilder(
                bloc: _homeBloc,
                builder: (BuildContext context, HomePageState homePageState) {
                  if (homePageState is RedirectToSettingsPageState) {
                    return SettingsPage(homePageAction: this,);
                  } else if (homePageState is RedirectToCategoriesPageState) {
                    return CategoriesPage(homePageAction: this,);
                  } else if (homePageState is RedirectToFundsManagementPageState) {
                    return FundsManagementPage(homePageAction: this,);
                  } else if (homePageState is RedirectToMyProfilePageState) {
                    return MyProfilePage();
                  } else if (homePageState is BackButtonState) {
                    //do nothing
                  }
                  return buildInitialHomePage();
                },
              ),
            ),
          ),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            setState(() {
              if (selectedPos == HomePageType.FUNDS.index) {
                _homeBloc.dispatch(RedirectToFundsManagementPageEvent());
              } else if (selectedPos == HomePageType.MY_PROFILE.index) {
                _homeBloc.dispatch(RedirectToMyProfilePageEvent());
              } else if (selectedPos == HomePageType.HOME.index) {
                _homeBloc.dispatch(InitialHomePageEvent());
              } else if (selectedPos == HomePageType.CATEGORY.index) {
                _homeBloc.dispatch(RedirectToCategoriesPageEvent());
              } else if (selectedPos == HomePageType.SETTINGS.index) {
                _homeBloc.dispatch(RedirectToSettingsPageEvent());
              }
              _navigationController.value = selectedPos;
            });
          },
        ),
      ),
    );
  }

  Widget buildInitialHomePage() {
    return Center(
      //todo fill home page with bottom bars
      child: Text("HOME PAGE"),
    );
  }

  Future<bool> _onWillPop() async {
    _homeBloc.dispatch(BackButtonEvent());
    return true;
  }

  @override
  void onLogout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  void redirectToNewExpensePage() {
    // TODO: implement redirectToNewExpensePage
  }

  @override
  void redirectToNewIncomePage() {
    // TODO: implement redirectToNewIncomePage
  }

  @override
  void redirectToNewIncomeCategoryPage() {
    // TODO: implement redirectToNewIncomeCategoryPage
  }

  @override
  void redirectToNewExpenseCategoryPage() {
    // TODO: implement redirectToNewExpenseCategoryPage
  }
}