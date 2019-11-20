import 'package:dartup_example/example1.dart';
import 'package:dartup_example/example2.dart';
import 'package:dartup_example/example3.dart';
import 'package:dartup_example/example4.dart';
import 'package:dartup_example/example5.dart';
import 'package:dartup_example/example6.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = new Store<AppState>(reducer, initialState: AppState(0));

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'DartUp Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'DartUp Flutter Demo'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        buttonTheme: ButtonThemeData(
          minWidth: 200,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example1()),
                  );
                },
                child: const Text(
                  'Calculator',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example2()),
                  );
                },
                child: const Text(
                  'QR Scanner',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example3()),
                  );
                },
                child: const Text(
                  'Redux App',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleToDoList()),
                  );
                },
                child: const Text(
                  'Dynamic List',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example5()),
                  );
                },
                child: const Text(
                  'Image Filter',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Example6()),
                  );
                },
                child: const Text(
                  'AnimatedTheme Example',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
