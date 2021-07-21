library volunteer_main_state;

import 'package:built_value/built_value.dart';

part 'volunteer_main_state.g.dart';

abstract class VolunteerMainState implements Built<VolunteerMainState, VolunteerMainStateBuilder> {
  // @nullable
  // String get user;

  List<String> get users;

  VolunteerMainState._();

  factory VolunteerMainState([updates(VolunteerMainStateBuilder b)]) = _$VolunteerMainState;

  factory VolunteerMainState.initial() {
    return VolunteerMainState((b) => b
    ..users = []);
  }
}
