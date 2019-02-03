import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: createHeader()
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: createLoginTextFieldDecoration("EMAIL"),
                ),
                TextField(
                  decoration: createLoginTextFieldDecoration("PASSWORD"),
                  obscureText: true,
                ),
                createSizedBox(5.0),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: InkWell(
                    child: createText("Forgot Password", createForgotPasswordTextStyle())),
                  ),
                createSizedBox(30.0),
                createLoginButton(),
                createSizedBox(20.0),
                createSignUpButton()
              ],
            ),
          )
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Stack createHeader() {
    return new Stack(children: <Widget>[
      createTopLabelsContainer(createText("My", createTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0)),
      createTopLabelsContainer(createText("Expenses", createTitleTextStyle()), EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0))
    ]);
  }

  Container createLoginButton() {
    return new Container(
      height: 50,
      child: Material(
        borderRadius: BorderRadius.circular(25.0),
        shadowColor: Colors.lightGreen,
        color: Colors.green,
        elevation: 7.0,
        child: GestureDetector(
          onTap: () {
            //todo login button
          },
          child: Center(
            child: createText("LOGIN", createLoginButtonTextStyle()),
          ),
        ),
      ),
    );
  }

  Container createSignUpButton() {
    return new Container(
      height: 50.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
            child: createText("SIGN UP", TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat"))
        ),
      ),
    );
  }

  Container createTopLabelsContainer(Text text, EdgeInsets insets) {
    return new Container(
      padding: insets,
      child: text,
    );
  }

  SizedBox createSizedBox(double height) {
    return new SizedBox(height: height,);
  }

  Text createText(String label, TextStyle textStyle) {
    return new Text(label, style: textStyle,);
  }

  TextStyle createTitleTextStyle() {
    return new TextStyle(fontSize : 80.0, fontWeight: FontWeight.bold);
  }

  TextStyle createLoginButtonTextStyle() {
    return new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Montserrat");
  }

  InputDecoration createLoginTextFieldDecoration(String labelText) {
    return new InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey)
    );
  }

  TextStyle createForgotPasswordTextStyle() {
    return new TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decoration: TextDecoration.underline);
  }
}
