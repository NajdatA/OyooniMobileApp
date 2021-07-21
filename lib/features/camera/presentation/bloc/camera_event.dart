import 'dart:io';

abstract class CameraEvent {}

class TextRecognitionEvent extends CameraEvent {
  final File image;

  TextRecognitionEvent(this.image);
}

class ImageCaptioningEvent extends CameraEvent {
  final File image;

  ImageCaptioningEvent(this.image);
}

class BanknoteRecognitionEvent extends CameraEvent {
  final File image;

  BanknoteRecognitionEvent(this.image);
}