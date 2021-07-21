library camera_state;

import 'package:built_value/built_value.dart';
import 'package:senior_project/core/util/constants.dart';

part 'camera_state.g.dart';

abstract class CameraState implements Built<CameraState, CameraStateBuilder> {
  bool get isLoading;

  @nullable
  String get recognizedText;

  @nullable
  String get captionedImage;

  @nullable
  String get recognizedBanknote;

  @nullable
  ErrorCode get error;

  CameraState._();

  factory CameraState([updates(CameraStateBuilder b)]) = _$CameraState;

  factory CameraState.initial() {
    return CameraState((b) => b);
  }
}
