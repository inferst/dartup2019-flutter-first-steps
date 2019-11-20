import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_redux/flutter_redux.dart';

@immutable
class AppState {
  final counter;

  AppState(this.counter);
}

//action
enum Actions { Increment }

//pure function
AppState reducer(AppState prev, action) {
  if (action == Actions.Increment) {
    return new AppState(prev.counter + 1);
  }
  return prev;
}

class Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Redux App"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new StoreConnector<AppState, int>(
              converter: (store) => store.state.counter,
              builder: (context, counter) => new Text(
                '$counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Actions.Increment);
        },
        builder: (context, callback) => new FloatingActionButton(
          onPressed: callback,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
