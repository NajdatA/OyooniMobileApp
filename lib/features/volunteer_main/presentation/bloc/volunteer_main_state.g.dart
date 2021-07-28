// GENERATED CODE - DO NOT MODIFY BY HAND

part of volunteer_main_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VolunteerMainState extends VolunteerMainState {
  @override
  final List<String> users;

  factory _$VolunteerMainState(
          [void Function(VolunteerMainStateBuilder)? updates]) =>
      (new VolunteerMainStateBuilder()..update(updates)).build();

  _$VolunteerMainState._({required this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, 'VolunteerMainState', 'users');
  }

  @override
  VolunteerMainState rebuild(
          void Function(VolunteerMainStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VolunteerMainStateBuilder toBuilder() =>
      new VolunteerMainStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VolunteerMainState && users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc(0, users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VolunteerMainState')
          ..add('users', users))
        .toString();
  }
}

class VolunteerMainStateBuilder
    implements Builder<VolunteerMainState, VolunteerMainStateBuilder> {
  _$VolunteerMainState? _$v;

  List<String>? _users;
  List<String>? get users => _$this._users;
  set users(List<String>? users) => _$this._users = users;

  VolunteerMainStateBuilder();

  VolunteerMainStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VolunteerMainState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VolunteerMainState;
  }

  @override
  void update(void Function(VolunteerMainStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VolunteerMainState build() {
    final _$result = _$v ??
        new _$VolunteerMainState._(
            users: BuiltValueNullFieldError.checkNotNull(
                users, 'VolunteerMainState', 'users'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
