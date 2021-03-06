import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/camera/domain/usecases/banknote_recognition.dart';
import 'package:senior_project/features/camera/domain/usecases/color_recognition.dart';
import 'package:senior_project/features/camera/domain/usecases/image_captioning.dart';
import 'package:senior_project/features/camera/domain/usecases/text_recognition.dart';
import 'camera_event.dart';
import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final ImageCaptioning imageCaptioning;
  final TextRecognition textRecognition;
  final BanknoteRecognition banknoteRecognition;
  final ColorRecognition colorRecognition;

  CameraBloc(this.textRecognition, this.banknoteRecognition,
      this.imageCaptioning, this.colorRecognition)
      : super(CameraState.initial());

  void onImageCaptioning(String image) {
    add(ImageCaptioningEvent(image));
  }

  void onTextRecognition(String image, bool isDocument) {
    add(TextRecognitionEvent(image, isDocument));
  }

  void onBanknoteRecognition(String image) {
    add(BanknoteRecognitionEvent(image));
  }

  void onColorRecognition(String image) {
    add(ColorRecognitionEvent(image));
  }

  void reset() {
    add(ResetEvent());
  }

  @override
  Stream<CameraState> mapEventToState(CameraEvent event) async* {
    print('${event.toString()}');
    if (event is TextRecognitionEvent) {
      yield state.rebuild((b) => b..isLoading = true);
      final result =
          await textRecognition(TextRecognitionParams(image: event.image));
      yield result.fold(
          (l) => state.rebuild((b) => b
            ..error = ErrorCode.NO_INTERNET_CONNECTION
            ..isLoading = false),
          (r) => state.rebuild((b) => b
            ..recognizedText = r
            ..isLoading = false));
    } else if (event is ImageCaptioningEvent) {
      yield state.rebuild((b) => b..isLoading = true);
      final result =
          await imageCaptioning(ImageCaptioningParams(image: event.image));
      yield result.fold(
          (l) => state.rebuild((b) => b
            ..error = ErrorCode.NO_INTERNET_CONNECTION
            ..isLoading = false), (r) {
        print('r is $r');
        return state.rebuild((b) => b
          ..isLoading = false
          ..captionedImage = r);
      });
      print("captioned image is ${state.captionedImage}");
    } else if (event is BanknoteRecognitionEvent) {
      yield state.rebuild((b) => b..isLoading = true);
      final result = await banknoteRecognition(
          BanknoteRecognitionParams(image: event.image));
      yield result.fold(
          (l) => state.rebuild((b) => b
            ..error = ErrorCode.NO_INTERNET_CONNECTION
            ..isLoading = false),
          (r) => state.rebuild((b) => b
            ..recognizedBanknote = r == 0
                ? '50 ????????'
                : r == 1
                    ? '50 ????????'
                    : r == 2
                        ? '100 ????????'
                        : r == 3
                            ? '500 ????????'
                            : r == 4
                                ? '500 ????????'
                                : r == 5
                                    ? '1000 ????????'
                                    : r == 6
                                        ? '1000 ????????'
                                        : r == 7
                                            ? '2000 ????????'
                                            : r == 8
                                                ? '5000 ????????'
                                                : r == 9
                                                    ? '200 ????????'
                                                    : '???????? ?????????? ?????? ????????????'
            ..isLoading = false));
    } else if (event is ColorRecognitionEvent) {
      yield state.rebuild((b) => b..isLoading = true);
      final result =
          await colorRecognition(ColorRecognitionParams(image: event.image));
      yield result.fold(
          (l) => state.rebuild((b) => b
            ..error = ErrorCode.NO_INTERNET_CONNECTION
            ..isLoading = false),
          (r) => state.rebuild((b) => b
            ..recognizedColor = r == 0
                ? '????????'
                : r == 1
                    ? '????????'
                    : r == 2
                        ? '????????'
                        : r == 3
                            ? '??????????????'
                            : r == 4
                                ? '????????'
                                : r == 5
                                    ? '????????'
                                    : r == 6
                                        ? '????????'
                                        : '???????? ?????????? ?????? ????????????'
            ..isLoading = false));
    } else if (event is ResetEvent) {
      yield state.rebuild((b) => b
        ..captionedImage = null
        ..recognizedColor = null
        ..recognizedBanknote = null
        ..recognizedText = null);
    }
  }
}
