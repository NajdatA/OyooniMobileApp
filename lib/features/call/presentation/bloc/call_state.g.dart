// GENERATED CODE - DO NOT MODIFY BY HAND

part of call_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CallState extends CallState {
  factory _$CallState([void Function(CallStateBuilder) updates]) =>
      (new CallStateBuilder()..update(updates)).build();

  _$CallState._() : super._();

  @override
  CallState rebuild(void Function(CallStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CallStateBuilder toBuilder() => new CallStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CallState;
  }

  @override
  int get hashCode {
    return 604492121;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('CallState').toString();
  }
}

class CallStateBuilder implements Builder<CallState, CallStateBuilder> {
  _$CallState _$v;

  CallStateBuilder();

  @override
  void replace(CallState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CallState;
  }

  @override
  void update(void Function(CallStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CallState build() {
    final _$result = _$v ?? new _$CallState._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
