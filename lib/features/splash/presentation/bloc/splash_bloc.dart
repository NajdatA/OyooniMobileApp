import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/splash/domain/usecase/get_user.dart';
import 'package:senior_project/features/splash/presentation/bloc/splash_event.dart';
import 'package:senior_project/features/splash/presentation/bloc/splash_state.dart';
import 'package:senior_project/features/splash/presentation/pages/splash_page.dart';

///
/// [SplashBloc] is the state management solution for the [SplashPage]
///
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetUser getUser;

  SplashBloc({
    required this.getUser,
  }) : super(SplashState.initial());

  void onScreenAppeared() {
    add(ScreenAppeared());
  }

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    print('${event.toString()}');
    if (event is ScreenAppeared) {
      yield* checkLanguageOrFailure(
          (await getUser(NoParams())), state);
    }
  }

  Stream<SplashState> checkLanguageOrFailure(
    Either<Failure, String> check,
    SplashState state,
  ) async* {
    yield* check.fold((failure) async* {
      yield state.rebuild((b) => b..user = '');
    }, (value) async* {
      yield state.rebuild((b) => b..user = value);
    });
  }
}
