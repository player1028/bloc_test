library welcome_bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'package:bloc_test/pages/screens/welcome/bloc/welcome_state.dart';
part 'package:bloc_test/pages/screens/welcome/bloc/welcome_events.dart';


class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>(_onWelcomeState);
  }


  _onWelcomeState(event, emit){
    emit(WelcomeState(page: state.page));
  }

}