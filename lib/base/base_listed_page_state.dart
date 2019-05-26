import 'package:flutter/material.dart';
import 'package:my_expenses/base/base_page_state.dart';
import 'package:my_expenses/utils/date_calculator.dart';

class BaseListedPageState<V extends StatefulWidget> extends BasePageState<V> {

  TextEditingController editingController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  Widget closeButton = new Container();
  var searchBarWidth = 100.0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) { }

  ExpansionTile createListItemTile(String name, VoidCallback editCallBack, VoidCallback deleteCallback, int timeStamp) {
    return new ExpansionTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 22.0),
      ),
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                createCreationTimeContainer(timeStamp),
                createListItemExpandableRow(editCallBack, deleteCallback)
              ],
            )
          ],
        )
      ],
    );
  }

  Container createCreationTimeContainer(int timeStamp) {
    if (timeStamp == -1) {
      return new Container(
        child: new Text(""),
      );
    } else {
      return new Container(
        child: new Text("Created: " + DateCalculator.buildDateTime(timeStamp)),
      );
    }
  }

  Row createListItemExpandableRow(VoidCallback editCallBack, VoidCallback deleteCallback) {
    return new Row(
      children: <Widget>[
        new IconButton(
          color: Colors.white,
          onPressed: editCallBack,
          icon: new Icon(Icons.edit,
              color: Colors.green),
        ),
        new IconButton(
          color: Colors.white,
          onPressed: deleteCallback,
          icon: new Icon(Icons.delete,
              color: Colors.green),
        ),
      ],
    );
  }

  void expandSearchBar() {
    setState(() {
      searchBarWidth = 250.0;
      closeButton = new IconButton(
          icon: new Icon(Icons.close), onPressed: () => closeSearchBar());
    });
  }

  void closeSearchBar() {
    setState(() {
      searchBarWidth = 100.0;
      closeButton = new Container();
      editingController.clear();
      myFocusNode.unfocus();
    });
  }

  Align createSearchBarContent(ValueChanged<String> onChanged) {
    return new Align(
      alignment: Alignment.centerLeft,
      child: new AnimatedContainer(
        duration: new Duration(milliseconds: 300),
        width: searchBarWidth,
        child: new Container(
          child: new Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: new TextField(
              focusNode: myFocusNode,
              onTap: () => expandSearchBar(),
              onChanged: onChanged,
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(25.0)))),
            ),
          ),
        ),
      ),
    );
  }

  Expanded createFilterListButton() {
    return new Expanded(
        child: new Align(
            alignment: Alignment.centerRight,
            child: new Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: new IconButton(
                  icon: new Icon(Icons.filter_list),
                  onPressed: () => {
                    //todo filterList
                  }),
            )
        )
    );
  }

  void showListItemDialog(BuildContext context, String mode, String prompt, VoidCallback confirmCallBack) {
    showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(mode),
            content: new Text(prompt),
            actions: <Widget>[
              new FlatButton(
                  onPressed: confirmCallBack,
                  child: new Text("YES")),
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("NO"))
            ],
          );
        }
    );
  }
}