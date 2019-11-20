import 'package:flutter/material.dart';

class ExampleToDoList extends StatefulWidget {
  @override
  ExampleToDoListState createState() {
    return new ExampleToDoListState();
  }
}

class ExampleToDoListState extends State<ExampleToDoList> {
  List<String> litems = [];

  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Dynamic ToDo List"),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
              child: new ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _getRowWithDivider(litems[index]);
                  }),
            )
          ],
        ));
  }

  Widget _getRowWithDivider(String text) {
    var children = <Widget>[
      new Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(text),
      ),
      new Divider(height: 5.0),
    ];

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
