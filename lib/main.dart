import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/blocs/counter/counter_bloc.dart';
import 'package:flutter_bloc_counter/blocs/counter/counter_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoc Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, counterState) {
                return Text(
                  '$counterState',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () => counterBloc.add(CounterEvent.decrement),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () => counterBloc.add(CounterEvent.increment),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
