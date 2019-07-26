import 'package:flutter/material.dart';
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
  String _myName = "My Name";
  String _totalFunds = "1500.00";
  String _totalFundsLabel = "Total funds";
  String _expensesQuantityLabel = "Expenses";
  String _expensesQuantity = "1000.00";
  ProfileStatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    initPresenter();
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(backgroundColor: Colors.green, title: Text('My Profile')),
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
                    margin: EdgeInsets.all(15.0),
                    child: createRaisedButton(() {
                      //todo redirect to edit user
                    }, createText("EDIT", createButtonTextStyle())),
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
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cat.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(color: Colors.black, width: 1.0),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 7.0)]),
      ),
    );
  }

  Widget buildFullName() {
    TextStyle textStyle = TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.w700);

    //todo build name
    return Text(
      _myName,
      style: textStyle,
    );
  }

  void initPresenter() {
    if (presenter == null) {
      presenter = new ProfileStatePresenter();
      presenter.attach(this);
      presenter.calculateData();
    }
  }

  Container buildUserData() {
    //todo get info about summary funds and limit
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              createText(_totalFundsLabel, createSimpleLabelTextStyle()),
              createText(_totalFunds, createSimpleDataTextStyle())
            ],
          ),
          Column(
            children: <Widget>[
              createText(_expensesQuantityLabel, createSimpleLabelTextStyle()),
              createText(_expensesQuantity, createSimpleDataTextStyle())
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
