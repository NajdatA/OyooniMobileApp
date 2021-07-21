import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/camera/domain/usecases/banknote_recognition.dart';
import 'package:senior_project/features/camera/domain/usecases/image_captioning.dart';
import 'package:senior_project/features/camera/domain/usecases/text_recognition.dart';
import 'camera_event.dart';
import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final ImageCaptioning imageCaptioning;
  final TextRecognition textRecognition;
  final BanknoteRecognition banknoteRecognition;

  CameraBloc(
    this.textRecognition,
    this.banknoteRecognition,
    this.imageCaptioning,
  ) : super(CameraState.initial());

  @override
  Stream<CameraState> mapEventToState(CameraEvent event) async* {
    print('${event.toString()}');
    if (event is TextRecognitionEvent) {
      yield state.rebuild((b) => b..isLoading = true);
      final result =
          await textRecognition(TextRecognitionParams(image: event.image));
      result.fold(
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
      result.fold(
          (l) => state.rebuild((b) => b
            ..error = ErrorCode.NO_INTERNET_CONNECTION
            ..isLoading = false),
          (r) => state.rebuild((b) => b
            ..captionedImage = r
            ..isLoading = false));
    } else if (event is BanknoteRecognitionEvent) {
      yield state.rebuild((b) => b..isLoading = true);
      final result = await banknoteRecognition(
          BanknoteRecognitionParams(image: event.image));
      result.fold(
          (l) => state.rebuild((b) => b
            ..error = ErrorCode.NO_INTERNET_CONNECTION
            ..isLoading = false),
          (r) => state.rebuild((b) => b
            ..recognizedBanknote = r == 1
                ? '50 ليرة'
                : r == 1
                    ? '50 ليرة'
                    : r == 2
                        ? '100 ليرة'
                        : r == 3
                            ? '500 ليرة'
                            : r == 4
                                ? '500 ليرة'
                                : r == 5
                                    ? '1000 ليرة'
                                    : r == 6
                                        ? '1000 ليرة'
                                        : r == 7
                                            ? '2000 ليرة'
                                            : r == 8
                                                ? '5000 ليرة'
                                                : r == 9
                                                    ? '200 ليرة'
                                                    : 'يرجى إعادة أخذ الصورة'
            ..isLoading = false));
    }
  }
}
