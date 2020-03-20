import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_counter/blocs/counter/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield _incrementCounter();
        break;
      case CounterEvent.decrement:
        yield _decrementCounter();
        break;
    }
  }

  int _incrementCounter() => state + 1;

  int _decrementCounter() => state - 1;
}
