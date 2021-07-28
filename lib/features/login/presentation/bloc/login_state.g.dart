// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final String email;
  @override
  final bool isLoading;
  @override
  final String password;
  @override
  final ErrorCode? error;
  @override
  final bool? isSuccess;
  @override
  final bool? isEmailValid;
  @override
  final bool? isPasswordValid;
  @override
  final bool tokenExist;

  factory _$LoginState([void Function(LoginStateBuilder)? updates]) =>
      (new LoginStateBuilder()..update(updates)).build();

  _$LoginState._(
      {required this.email,
      required this.isLoading,
      required this.password,
      this.error,
      this.isSuccess,
      this.isEmailValid,
      this.isPasswordValid,
      required this.tokenExist})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, 'LoginState', 'email');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'LoginState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(password, 'LoginState', 'password');
    BuiltValueNullFieldError.checkNotNull(
        tokenExist, 'LoginState', 'tokenExist');
  }

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        email == other.email &&
        isLoading == other.isLoading &&
        password == other.password &&
        error == other.error &&
        isSuccess == other.isSuccess &&
        isEmailValid == other.isEmailValid &&
        isPasswordValid == other.isPasswordValid &&
        tokenExist == other.tokenExist;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, email.hashCode), isLoading.hashCode),
                            password.hashCode),
                        error.hashCode),
                    isSuccess.hashCode),
                isEmailValid.hashCode),
            isPasswordValid.hashCode),
        tokenExist.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginState')
          ..add('email', email)
          ..add('isLoading', isLoading)
          ..add('password', password)
          ..add('error', error)
          ..add('isSuccess', isSuccess)
          ..add('isEmailValid', isEmailValid)
          ..add('isPasswordValid', isPasswordValid)
          ..add('tokenExist', tokenExist))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  ErrorCode? _error;
  ErrorCode? get error => _$this._error;
  set error(ErrorCode? error) => _$this._error = error;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isEmailValid;
  bool? get isEmailValid => _$this._isEmailValid;
  set isEmailValid(bool? isEmailValid) => _$this._isEmailValid = isEmailValid;

  bool? _isPasswordValid;
  bool? get isPasswordValid => _$this._isPasswordValid;
  set isPasswordValid(bool? isPasswordValid) =>
      _$this._isPasswordValid = isPasswordValid;

  bool? _tokenExist;
  bool? get tokenExist => _$this._tokenExist;
  set tokenExist(bool? tokenExist) => _$this._tokenExist = tokenExist;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _isLoading = $v.isLoading;
      _password = $v.password;
      _error = $v.error;
      _isSuccess = $v.isSuccess;
      _isEmailValid = $v.isEmailValid;
      _isPasswordValid = $v.isPasswordValid;
      _tokenExist = $v.tokenExist;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginState build() {
    final _$result = _$v ??
        new _$LoginState._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'LoginState', 'email'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'LoginState', 'isLoading'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'LoginState', 'password'),
            error: error,
            isSuccess: isSuccess,
            isEmailValid: isEmailValid,
            isPasswordValid: isPasswordValid,
            tokenExist: BuiltValueNullFieldError.checkNotNull(
                tokenExist, 'LoginState', 'tokenExist'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
