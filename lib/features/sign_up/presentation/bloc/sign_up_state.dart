library sign_up_state;

import 'package:built_value/built_value.dart';
import 'package:senior_project/core/util/constants.dart';

part 'sign_up_state.g.dart';

abstract class SignUpState implements Built<SignUpState, SignUpStateBuilder> {
  String get email;

  // String get username;
  String get first;

  String get last;

  bool get isLoading;

  String get password;

  String get confirmationPassword;

  ErrorCode? get error;


  bool? get isSuccess;

  bool? get isEmailValid;

  bool? get isUsernameValid;

  bool? get isPasswordValid;

  bool? get isConfirmationPasswordValid;

  bool get isSignUpEnabled =>
      (isEmailValid ?? false) &&
      (isPasswordValid ?? false) &&
      (isConfirmationPasswordValid ?? false) &&
      (isUsernameValid ?? false);

  SignUpState._();

  factory SignUpState([updates(SignUpStateBuilder b)]) = _$SignUpState;

  factory SignUpState.initial() {
    return SignUpState((b) => b
      ..email = ''
      // ..username = ''
      ..first = ''
      ..last = ''
      ..isLoading = false
      ..password = ''
      ..confirmationPassword = '');
  }
}
