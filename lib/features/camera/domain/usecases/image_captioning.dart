import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/camera/domain/repositories/camera_repository.dart';

class ImageCaptioning extends UseCase<String, ImageCaptioningParams> {
  final CameraRepository repository;

  ImageCaptioning({required this.repository});

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.imageCaptioning(params.image);
  }
}

class ImageCaptioningParams extends Equatable {
  final String image;

  ImageCaptioningParams({
    required this.image,
  });

  @override
  List<Object> get props => [
    image,
  ];
}
