import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/login/domain/entity/tokens_entity.dart';
import 'package:senior_project/features/login/domain/usecase/check_token.dart';
import 'package:senior_project/features/login/domain/usecase/login.dart';
import 'package:senior_project/features/login/domain/validator/login_input_validators.dart';

import 'login_event.dart';
import 'login_state.dart';

///
/// GitScrum #TK-15
///
/// [LoginBloc] is the state management solution for the [LoginPage]
///
///
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginInputValidators loginInputValidators;
  final Login login;
  final CheckToken token;

  LoginBloc({
    @required this.loginInputValidators,
    @required this.login,
    @required this.token,
  }) : super(LoginState.initial());

  void onChangeEmail(String email) {
    add(ChangeEmail(email));
  }

  void onChangePassword(String password) {
    add(ChangePassword(password));
  }

  void onLoginInitiated() {
    add(LoginInitiated());
  }

  void resetErrors() {
    add(ResetError());
  }

  void checkToken() {
    add(CheckTokenEvent());
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print('${event.toString()}');

    // Receiving [ChangeEmail] event
    if (event is ChangeEmail) {
      yield* _checkUsersEmail(
        loginInputValidators.validateEmailInput(event.email),
        state,
      );
    }

    // Receiving [ChangePassword] event
    else if (event is ChangePassword) {
      yield* _checkPassword(
        loginInputValidators.validatePasswordInput(event.password),
        state,
      );
    }

    // Receiving [ResetError] event
    // else
    else if (event is ResetError) {
      yield state.rebuild((builder) =>
      builder
        ..isSuccess = false
        ..error = null
        ..isLoading = false);
    }

    // Receiving [LoginInitiated] event
    else if (event is LoginInitiated) {
      yield* _onLoginInitiated(
        login(
          LoginParams(
            email: state.email,
            password: state.password,
          ),
        ),
        state,
      );
    } else if (event is CheckTokenEvent) {
      yield state.rebuild((builder) => builder..isLoading = true);
      final result = await token(NoParams());
      yield* result.fold(
              (l) async* {
            yield state.rebuild((builder) =>
            builder
              ..isLoading = false
              ..tokenExist = false);
          },
              (r) async* {
            yield state.rebuild((builder) =>
            builder
              ..isLoading = false
              ..tokenExist = r);
          });
    }
  }

  ///
  /// GitScrum #TK-15
  ///
  /// Handling the [ChangeEmail] event
  ///
  ///
  Stream<LoginState> _checkUsersEmail(Either<Failure, String> checkEmail,
      LoginState state,) async* {
    print('hahha success is ${state.isSuccess}');
    yield* checkEmail.fold((failure) async* {
      yield state.rebuild((b) =>
      b
        ..isEmailValid = false
        ..isSuccess = false);
    }, (value) async* {
      yield state.rebuild((b) =>
      b
        ..email = value
        ..isEmailValid = true);
    });
  }

  ///
  /// GitScrum #TK-15
  ///
  /// Handling the [LoginInitiated] event
  ///
  ///
  Stream<LoginState> _onLoginInitiated(
      Future<Either<Failure, TokensEntity>> loginUser,
      LoginState state,) async* {
    yield state.rebuild((builder) =>
    builder
      ..isLoading = true
      ..isSuccess = false
      ..error = null);

    final result = await loginUser;

    yield* result.fold((l) async* {
      if (l is ServerFailure)
        yield state.rebuild((builder) =>
        builder
          ..error = l.errorCode
          ..isSuccess = false
          ..isLoading = false);
      else
        yield state.rebuild((builder) =>
        builder
          ..error = ErrorCode.SERVER_ERROR
          ..isSuccess = false
          ..isLoading = false);
    }, (r) async* {
      print('success logging in');
      // try {
      //   await registerDevice(RegisterDeviceParams());
      // } catch (e) {
      //   print('e is $e');
      // }
      yield state.rebuild((builder) =>
      builder
        ..error = null
        ..isLoading = false
        ..tokenExist = true
        ..isSuccess = true);
    });
  }

  ///
  /// GitScrum #TK-15
  ///
  /// Handling the [ChangePassword] event
  ///
  ///
  Stream<LoginState> _checkPassword(Either<Failure, String> checkPassword,
      LoginState state,) async* {
    yield* checkPassword.fold((failure) async* {
      yield state.rebuild((b) => b..isPasswordValid = false);
    }, (value) async* {
      yield state.rebuild((b) =>
      b
        ..password = value
        ..isPasswordValid = true);
    });
  }
}
