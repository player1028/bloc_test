library app_bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'package:bloc_test/app_event.dart';
part 'package:bloc_test/app_state.dart';



class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitState()) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }


  _onIncrement(event, emit) {
    emit(AppState(count: state.count + 1));
  }

  _onDecrement(event, emit) {
    if(state.count<=0) return;
    emit(AppState(count: state.count - 1));
  }
}