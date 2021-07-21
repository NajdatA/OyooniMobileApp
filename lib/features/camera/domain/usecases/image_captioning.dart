import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/camera/domain/repositories/camera_repository.dart';
import 'package:senior_project/features/login/domain/entity/tokens_entity.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class ImageCaptioning extends UseCase<String, ImageCaptioningParams> {
  final CameraRepository repository;

  ImageCaptioning({@required this.repository}) : assert(repository != null);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.imageCaptioning(params.image);
  }
}

class ImageCaptioningParams extends Equatable {
  final File image;

  ImageCaptioningParams({
    this.image,
  });

  @override
  List<Object> get props => [
    image,
  ];
}
