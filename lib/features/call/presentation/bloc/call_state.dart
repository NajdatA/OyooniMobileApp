library call_state;

import 'package:built_value/built_value.dart';
import 'package:senior_project/core/util/constants.dart';

part 'call_state.g.dart';

abstract class CallState implements Built<CallState, CallStateBuilder> {

  CallState._();

  factory CallState([updates(CallStateBuilder b)]) = _$CallState;

  factory CallState.initial() {
    return CallState((b) => b);
  }
}
