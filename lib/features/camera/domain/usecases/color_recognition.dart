import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/camera/domain/repositories/camera_repository.dart';

class ColorRecognition extends UseCase<int, ColorRecognitionParams> {
  final CameraRepository repository;

  ColorRecognition({required this.repository});

  @override
  Future<Either<Failure, int>> call(params) async {
    return await repository.colorRecognition(params.image);
  }
}

class ColorRecognitionParams extends Equatable {
  final String image;

  ColorRecognitionParams({
    required this.image,
  });

  @override
  List<Object> get props => [
    image,
  ];
}
