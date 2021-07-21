import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/splash/domain/usecase/get_user.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final GetLanguage getLanguage;
  //
  HomeBloc(
  //   @required this.getLanguage,
  ) : super(HomeState.initial());
  //
  // void onScreenAppeared() {
  //   add(ScreenAppeared());
  // }
  //
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
  //   print('${event.toString()}');
  //   if (event is ScreenAppeared) {
  //     yield* checkLanguageOrFailure(
  //         (await getLanguage(NoParams())), state);
  //   }
  }

  // Stream<HomeState> checkLanguageOrFailure(
  //   Either<Failure, String> check,
  //   HomeState state,
  // ) async* {
  //   yield* check.fold((failure) async* {
  //     yield state.rebuild((b) => b..language = '');
  //   }, (value) async* {
  //     yield state.rebuild((b) => b..language = value);
  //   });
  // }
}
