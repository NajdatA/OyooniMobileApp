abstract class CameraEvent {}

class TextRecognitionEvent extends CameraEvent {
  final String image;
  final bool isDocument;

  TextRecognitionEvent(this.image, this.isDocument);
}

class ImageCaptioningEvent extends CameraEvent {
  final String image;

  ImageCaptioningEvent(this.image);
}

class BanknoteRecognitionEvent extends CameraEvent {
  final String image;

  BanknoteRecognitionEvent(this.image);
}

class ColorRecognitionEvent extends CameraEvent {
  final String image;

  ColorRecognitionEvent(this.image);
}
class ResetEvent extends CameraEvent {}