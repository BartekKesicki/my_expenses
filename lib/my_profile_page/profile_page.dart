import 'package:flutter/material.dart';
import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';
import 'package:my_expenses/app_properties/app_styles.dart';
import 'package:my_expenses/app_properties/app_widgets.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:my_expenses/my_profile_page/my_profile_clipper.dart';
import 'package:my_expenses/my_profile_page/profile_state_presenter.dart';
import 'package:my_expenses/my_profile_page/profile_state_view.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage>
    implements ProfileStateView {
  //todo remove mocks
  String _myName = "My Name";
  String _totalFunds = "0.00";
  String _totalFundsLabel = "Start funds";
  String _expensesQuantityLabel = "Expenses";
  String _expensesQuantity = "0.00";
  ProfileStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(backgroundColor: Colors.green, title: Text(AppStrings.myProfile)),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyProfileClipper(),
            child: Container(color: Colors.black.withOpacity(0.8)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height / 6.4,
                  ),
                  buildProfileImage(),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildFullName(),
                  SizedBox(
                    height: 10.0,
                  ),
                  buildUserData(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(AppDimens.profilePageMarginDimen),
                    child: AppWidgets.createRaisedButton(() {
                      //todo redirect to edit user
                    }, AppWidgets.createText(AppStrings.edit, AppStyles.createButtonTextStyle())),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return Center(
      child: new Container(
        width: AppDimens.profilePageImageDimen,
        height: AppDimens.profilePageImageDimen,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cat.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(AppDimens.profileCircularBorderRadius),
            border: Border.all(color: Colors.black, width: AppDimens.profileImageBorderWidth),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: AppDimens.profilePageImageBlurRadius)]),
      ),
    );
  }

  Widget buildFullName() {
    TextStyle textStyle = TextStyle(
        fontFamily: AppStrings.robotoFont,
        color: Colors.black,
        fontSize: AppDimens.profilePageFullNameFontSize,
        fontWeight: FontWeight.w700);
    return Text(
      _myName,
      style: textStyle,
    );
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = new ProfileStatePresenter();
      presenter.attach(this);
      presenter.performLoadProfileData();
    }
  }

  Container buildUserData() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              AppWidgets.createText(_totalFundsLabel, AppStyles.createSimpleLabelTextStyle()),
              AppWidgets.createText(_totalFunds, AppStyles.createSimpleDataTextStyle())
            ],
          ),
          Column(
            children: <Widget>[
              AppWidgets.createText(_expensesQuantityLabel, AppStyles.createSimpleLabelTextStyle()),
              AppWidgets.createText(_expensesQuantity, AppStyles.createSimpleDataTextStyle())
            ],
          ),
        ],
      ),
      margin: EdgeInsets.all(20.0),
    );
  }

  @override
  void fillExpensesData(int totalExpenses, double totalFunds) {
    setState(() {
      _expensesQuantity = totalExpenses.toString();
      _totalFunds = totalFunds.toString();
    });
  }

  @override
  void fillUserData(User user) {
    setState(() {
      _myName = user.email;
    });
  }
}
