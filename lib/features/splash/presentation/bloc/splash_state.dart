library splash_state;

import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

///
/// [SplashState] is the class representing the [SplashPage]'s state
///
/// Using [BuiltValue] we can accomplish immutability and rebuilding the same state instead of creating
/// a new one each time the state has changed
///
abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  String? get user;

  SplashState._();

  factory SplashState([updates(SplashStateBuilder b)]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b);
  }
}
