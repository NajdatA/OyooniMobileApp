library login_state;

import 'package:built_value/built_value.dart';
import 'package:senior_project/core/util/constants.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  String get email;

  bool get isLoading;

  String get password;

  // @nullable
  // User get user;

  ErrorCode? get error;

  bool? get isSuccess;

  bool? get isEmailValid;


  bool? get isPasswordValid;

  bool get tokenExist;

  bool get isLoginEnabled =>
      (isEmailValid ?? false) && (isPasswordValid ?? false);

  LoginState._();

  factory LoginState([updates(LoginStateBuilder b)]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) => b
      ..email = ''
      ..isLoading = false
      ..tokenExist = false
      ..password = ''
      ..isSuccess = false);
  }
}
