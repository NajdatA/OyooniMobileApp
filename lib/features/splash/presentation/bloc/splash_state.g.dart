// GENERATED CODE - DO NOT MODIFY BY HAND

part of splash_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final String user;

  factory _$SplashState([void Function(SplashStateBuilder) updates]) =>
      (new SplashStateBuilder()..update(updates)).build();

  _$SplashState._({this.user}) : super._();

  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => new SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SplashState')..add('user', user))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState _$v;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SplashState build() {
    final _$result = _$v ?? new _$SplashState._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
