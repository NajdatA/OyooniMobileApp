import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/sign_up/domain/entity/user.dart';
import 'package:senior_project/features/sign_up/domain/usecase/sign_up.dart';
import 'package:senior_project/features/sign_up/domain/validator/sign_up_input_validators.dart';
import 'package:senior_project/features/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:senior_project/features/sign_up/presentation/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpInputValidators signUpInputValidators;
  final SignUp signUp;

  SignUpBloc({
    required this.signUpInputValidators,
    required this.signUp,
  }) : super(SignUpState.initial());

  void onChangeFirstName(String first) {
    add(ChangeFirstName(first));
  }

  void onChangeLastName(String last) {
    add(ChangeLastName(last));
  }

  void onChangeEmail(String email) {
    add(ChangeEmail(email));
  }

  void onChangePassword(String password) {
    add(ChangePassword(password));
  }

  void onChangeConfirmationPassword(String confirmationPassword) {
    add(ChangeConfirmationPassword(confirmationPassword));
  }

  void onSignUpInitiated() {
    add(SignUpInitiated());
  }

  void resetErrors() {
    add(ResetError());
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    print('${event.toString()}');

    if (event is ChangeFirstName) {
      yield state.rebuild((b) => b..first = event.first);
    } else if (event is ChangeLastName) {
      yield state.rebuild((b) => b..last = event.last);
    } else if (event is ChangeEmail) {
      yield* _checkUsersEmail(
        signUpInputValidators.validateEmailInput(event.email),
        state,
      );
    }
    if (event is ChangePassword) {
      yield* _checkPassword(
        signUpInputValidators.validatePasswordInput(event.password),
        state,
      );
    }
    // Receiving [ChangeConfirmationPassword] event
    else if (event is ChangeConfirmationPassword) {
      yield* _checkConfirmationPassword(
        event.confirmationPassword,
        state,
      );
    }
    // Receiving [ResetError] event
    else if (event is ResetError) {
      yield state.rebuild((builder) => builder
        ..error = null
        ..isLoading = false);
    }

    // Receiving [SignUpInitiated] event
    else if (event is SignUpInitiated) {
      yield* _onSignUpInitiated(
        signUp(
          SignUpParams(
            email: state.email,
            first: state.first,
            last: state.last,
            password: state.password,
            confirmPassword: state.confirmationPassword,
          ),
        ),
        state,
      );
    }
  }

  Stream<SignUpState> _onSignUpInitiated(
    Future<Either<Failure, bool>> signUpUser,
    SignUpState state,
  ) async* {
    yield state.rebuild((builder) => builder
      ..isLoading = true
      ..isSuccess = false
      ..error = null);

    final result = await signUpUser;

    yield* result.fold((l) async* {
      if (l is ServerFailure)
        yield state.rebuild((builder) => builder
          ..error = l.errorCode
          ..isSuccess = false
          ..isLoading = false);
      else
        yield state.rebuild((builder) => builder
          ..error = ErrorCode.SERVER_ERROR
          ..isSuccess = false
          ..isLoading = false);
    }, (r) async* {
      yield state.rebuild((builder) => builder
        ..error = null
        ..isLoading = false
        ..isSuccess = true);
    });
  }

  ///
  /// GitScrum #TK-12
  ///
  /// Handling the [ChangeEmail] event
  ///
  ///
  Stream<SignUpState> _checkUsersEmail(
    Either<Failure, String> checkEmail,
    SignUpState state,
  ) async* {
    yield* checkEmail.fold((failure) async* {
      yield state.rebuild((b) => b..isEmailValid = false);
    }, (value) async* {
      yield state.rebuild((b) => b
        ..email = value
        ..isEmailValid = true);
    });
  }

  Stream<SignUpState> _checkPassword(
    Either<Failure, String> checkPassword,
    SignUpState state,
  ) async* {
    yield* checkPassword.fold((failure) async* {
      yield state.rebuild((b) => b..isPasswordValid = false);
    }, (value) async* {
      yield state.rebuild((b) => b
        ..password = value
        ..isPasswordValid = true);
    });
  }

  Stream<SignUpState> _checkConfirmationPassword(
    confirmationPassword,
    SignUpState state,
  ) async* {
    if (confirmationPassword != state.password)
      yield state.rebuild((b) => b..isConfirmationPasswordValid = false);
    else
      yield state.rebuild((b) => b
        ..confirmationPassword = confirmationPassword
        ..isConfirmationPasswordValid = true);
  }
}
