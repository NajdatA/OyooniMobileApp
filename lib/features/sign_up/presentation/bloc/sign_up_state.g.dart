// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_up_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignUpState extends SignUpState {
  @override
  final String email;
  @override
  final String first;
  @override
  final String last;
  @override
  final bool isLoading;
  @override
  final String password;
  @override
  final String confirmationPassword;
  @override
  final ErrorCode? error;
  @override
  final bool? isSuccess;
  @override
  final bool? isEmailValid;
  @override
  final bool? isUsernameValid;
  @override
  final bool? isPasswordValid;
  @override
  final bool? isConfirmationPasswordValid;

  factory _$SignUpState([void Function(SignUpStateBuilder)? updates]) =>
      (new SignUpStateBuilder()..update(updates)).build();

  _$SignUpState._(
      {required this.email,
      required this.first,
      required this.last,
      required this.isLoading,
      required this.password,
      required this.confirmationPassword,
      this.error,
      this.isSuccess,
      this.isEmailValid,
      this.isUsernameValid,
      this.isPasswordValid,
      this.isConfirmationPasswordValid})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, 'SignUpState', 'email');
    BuiltValueNullFieldError.checkNotNull(first, 'SignUpState', 'first');
    BuiltValueNullFieldError.checkNotNull(last, 'SignUpState', 'last');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'SignUpState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(password, 'SignUpState', 'password');
    BuiltValueNullFieldError.checkNotNull(
        confirmationPassword, 'SignUpState', 'confirmationPassword');
  }

  @override
  SignUpState rebuild(void Function(SignUpStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpStateBuilder toBuilder() => new SignUpStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpState &&
        email == other.email &&
        first == other.first &&
        last == other.last &&
        isLoading == other.isLoading &&
        password == other.password &&
        confirmationPassword == other.confirmationPassword &&
        error == other.error &&
        isSuccess == other.isSuccess &&
        isEmailValid == other.isEmailValid &&
        isUsernameValid == other.isUsernameValid &&
        isPasswordValid == other.isPasswordValid &&
        isConfirmationPasswordValid == other.isConfirmationPasswordValid;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, email.hashCode),
                                                first.hashCode),
                                            last.hashCode),
                                        isLoading.hashCode),
                                    password.hashCode),
                                confirmationPassword.hashCode),
                            error.hashCode),
                        isSuccess.hashCode),
                    isEmailValid.hashCode),
                isUsernameValid.hashCode),
            isPasswordValid.hashCode),
        isConfirmationPasswordValid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpState')
          ..add('email', email)
          ..add('first', first)
          ..add('last', last)
          ..add('isLoading', isLoading)
          ..add('password', password)
          ..add('confirmationPassword', confirmationPassword)
          ..add('error', error)
          ..add('isSuccess', isSuccess)
          ..add('isEmailValid', isEmailValid)
          ..add('isUsernameValid', isUsernameValid)
          ..add('isPasswordValid', isPasswordValid)
          ..add('isConfirmationPasswordValid', isConfirmationPasswordValid))
        .toString();
  }
}

class SignUpStateBuilder implements Builder<SignUpState, SignUpStateBuilder> {
  _$SignUpState? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _first;
  String? get first => _$this._first;
  set first(String? first) => _$this._first = first;

  String? _last;
  String? get last => _$this._last;
  set last(String? last) => _$this._last = last;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _confirmationPassword;
  String? get confirmationPassword => _$this._confirmationPassword;
  set confirmationPassword(String? confirmationPassword) =>
      _$this._confirmationPassword = confirmationPassword;

  ErrorCode? _error;
  ErrorCode? get error => _$this._error;
  set error(ErrorCode? error) => _$this._error = error;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isEmailValid;
  bool? get isEmailValid => _$this._isEmailValid;
  set isEmailValid(bool? isEmailValid) => _$this._isEmailValid = isEmailValid;

  bool? _isUsernameValid;
  bool? get isUsernameValid => _$this._isUsernameValid;
  set isUsernameValid(bool? isUsernameValid) =>
      _$this._isUsernameValid = isUsernameValid;

  bool? _isPasswordValid;
  bool? get isPasswordValid => _$this._isPasswordValid;
  set isPasswordValid(bool? isPasswordValid) =>
      _$this._isPasswordValid = isPasswordValid;

  bool? _isConfirmationPasswordValid;
  bool? get isConfirmationPasswordValid => _$this._isConfirmationPasswordValid;
  set isConfirmationPasswordValid(bool? isConfirmationPasswordValid) =>
      _$this._isConfirmationPasswordValid = isConfirmationPasswordValid;

  SignUpStateBuilder();

  SignUpStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _first = $v.first;
      _last = $v.last;
      _isLoading = $v.isLoading;
      _password = $v.password;
      _confirmationPassword = $v.confirmationPassword;
      _error = $v.error;
      _isSuccess = $v.isSuccess;
      _isEmailValid = $v.isEmailValid;
      _isUsernameValid = $v.isUsernameValid;
      _isPasswordValid = $v.isPasswordValid;
      _isConfirmationPasswordValid = $v.isConfirmationPasswordValid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUpState;
  }

  @override
  void update(void Function(SignUpStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpState build() {
    final _$result = _$v ??
        new _$SignUpState._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'SignUpState', 'email'),
            first: BuiltValueNullFieldError.checkNotNull(
                first, 'SignUpState', 'first'),
            last: BuiltValueNullFieldError.checkNotNull(
                last, 'SignUpState', 'last'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'SignUpState', 'isLoading'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'SignUpState', 'password'),
            confirmationPassword: BuiltValueNullFieldError.checkNotNull(
                confirmationPassword, 'SignUpState', 'confirmationPassword'),
            error: error,
            isSuccess: isSuccess,
            isEmailValid: isEmailValid,
            isUsernameValid: isUsernameValid,
            isPasswordValid: isPasswordValid,
            isConfirmationPasswordValid: isConfirmationPasswordValid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
