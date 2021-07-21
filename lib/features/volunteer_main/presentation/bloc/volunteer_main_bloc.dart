import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:senior_project/features/volunteer_main/presentation/bloc/volunteer_main_event.dart';
import 'package:senior_project/features/volunteer_main/presentation/bloc/volunteer_main_state.dart';
import 'package:signalr_client/hub_connection.dart';

class VolunteerMainBloc extends Bloc<VolunteerMainEvent, VolunteerMainState> {
  VolunteerMainBloc() : super(VolunteerMainState.initial());

  void onAddNewHelpRequest(String id) {
    add(AddNewHelpRequestEvent(id));
  }

  void onCancelHelpRequest(String id) {
    add(CancelHelpRequestEvent(id));
  }

  @override
  Stream<VolunteerMainState> mapEventToState(VolunteerMainEvent event) async* {
    print('${event.toString()}');
    if (event is AddNewHelpRequestEvent) {
      if (!state.users.contains(event.id))
        yield state.rebuild((b) => b..users.add(event.id));
    } else if (event is CancelHelpRequestEvent) {
      if (state.users.contains(event.id))
        yield state.rebuild((b) => b..users.remove(event.id));
    }
  }
}
