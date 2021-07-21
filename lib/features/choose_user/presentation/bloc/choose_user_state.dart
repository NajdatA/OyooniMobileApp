library choose_user_state;

import 'package:built_value/built_value.dart';

part 'choose_user_state.g.dart';

abstract class ChooseUserState implements Built<ChooseUserState, ChooseUserStateBuilder> {
  @nullable
  String get user;

  ChooseUserState._();

  factory ChooseUserState([updates(ChooseUserStateBuilder b)]) = _$ChooseUserState;

  factory ChooseUserState.initial() {
    return ChooseUserState((b) => b);
  }
}
