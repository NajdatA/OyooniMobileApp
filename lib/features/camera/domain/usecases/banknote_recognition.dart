import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/camera/domain/repositories/camera_repository.dart';

class BanknoteRecognition extends UseCase<int, BanknoteRecognitionParams> {
  final CameraRepository repository;

  BanknoteRecognition({@required this.repository}) : assert(repository != null);

  @override
  Future<Either<Failure, int>> call(params) async {
    return await repository.banknoteRecognition(params.image);
  }
}

class BanknoteRecognitionParams extends Equatable {
  final File image;

  BanknoteRecognitionParams({
    this.image,
  });

  @override
  List<Object> get props => [
    image,
  ];
}
