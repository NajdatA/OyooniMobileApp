import 'dart:async';
import 'package:bloc/bloc.dart';
import 'call_event.dart';
import 'call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  CallBloc() : super(CallState.initial());

  @override
  Stream<CallState> mapEventToState(CallEvent event) async* {
    print('${event.toString()}');
  }
}
