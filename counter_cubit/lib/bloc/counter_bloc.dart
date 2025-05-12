import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
   on<CounterIncrementEvent>((event, emit) => emit(CounterState(count: state.count+1,wasIncremented: true)));
   on<CounterDecrementEvent>((event, emit) => emit(CounterState(count: state.count-1,wasIncremented: false)));
  }
  

}
