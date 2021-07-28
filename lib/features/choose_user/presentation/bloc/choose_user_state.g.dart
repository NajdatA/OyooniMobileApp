// GENERATED CODE - DO NOT MODIFY BY HAND

part of choose_user_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChooseUserState extends ChooseUserState {
  @override
  final String? user;

  factory _$ChooseUserState([void Function(ChooseUserStateBuilder)? updates]) =>
      (new ChooseUserStateBuilder()..update(updates)).build();

  _$ChooseUserState._({this.user}) : super._();

  @override
  ChooseUserState rebuild(void Function(ChooseUserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChooseUserStateBuilder toBuilder() =>
      new ChooseUserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChooseUserState && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChooseUserState')..add('user', user))
        .toString();
  }
}

class ChooseUserStateBuilder
    implements Builder<ChooseUserState, ChooseUserStateBuilder> {
  _$ChooseUserState? _$v;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  ChooseUserStateBuilder();

  ChooseUserStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChooseUserState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChooseUserState;
  }

  @override
  void update(void Function(ChooseUserStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChooseUserState build() {
    final _$result = _$v ?? new _$ChooseUserState._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
