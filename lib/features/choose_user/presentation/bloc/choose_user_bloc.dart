import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/util/app_language.dart';
import 'package:senior_project/features/choose_user/domain/usecase/choose_user.dart';

import 'choose_user_event.dart';
import 'choose_user_state.dart';

class ChooseUserBloc extends Bloc<ChooseUserEvent, ChooseUserState> {
  final ChooseUser chooseUser;

  ChooseUserBloc({
    @required this.chooseUser,
  }) : super(ChooseUserState.initial());

  void user(String language) {
    add(ChooseUserEvent(language));
  }

  @override
  Stream<ChooseUserState> mapEventToState(UserEvent event) async* {
    print('${event.toString()}');
    if (event is ChooseUserEvent) {
      yield* chooseLanguageOrFailure(
          (await chooseUser(ChooseUserParams(event.language))), state);
    }
  }

  Stream<ChooseUserState> chooseLanguageOrFailure(
    Either<Failure, String> chooseLanguage,
      ChooseUserState state,
  ) async* {
    yield* chooseLanguage.fold((failure) async* {
      yield state.rebuild((b) => b..user = '');
      // changeAppLanguage(0);
    }, (value) async* {
      yield state.rebuild((b) => b..user = value);
      // value == "ar" ? changeAppLanguage(1) : changeAppLanguage(0);
    });
  }
}
