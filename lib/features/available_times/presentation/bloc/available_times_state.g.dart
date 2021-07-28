// GENERATED CODE - DO NOT MODIFY BY HAND

part of available_times_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AvailableTimesState extends AvailableTimesState {
  @override
  final bool isLoading;
  @override
  final AvailableTimesEntity? availableTimes;

  factory _$AvailableTimesState(
          [void Function(AvailableTimesStateBuilder)? updates]) =>
      (new AvailableTimesStateBuilder()..update(updates)).build();

  _$AvailableTimesState._({required this.isLoading, this.availableTimes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'AvailableTimesState', 'isLoading');
  }

  @override
  AvailableTimesState rebuild(
          void Function(AvailableTimesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvailableTimesStateBuilder toBuilder() =>
      new AvailableTimesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvailableTimesState &&
        isLoading == other.isLoading &&
        availableTimes == other.availableTimes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), availableTimes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AvailableTimesState')
          ..add('isLoading', isLoading)
          ..add('availableTimes', availableTimes))
        .toString();
  }
}

class AvailableTimesStateBuilder
    implements Builder<AvailableTimesState, AvailableTimesStateBuilder> {
  _$AvailableTimesState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  AvailableTimesEntity? _availableTimes;
  AvailableTimesEntity? get availableTimes => _$this._availableTimes;
  set availableTimes(AvailableTimesEntity? availableTimes) =>
      _$this._availableTimes = availableTimes;

  AvailableTimesStateBuilder();

  AvailableTimesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _availableTimes = $v.availableTimes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AvailableTimesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvailableTimesState;
  }

  @override
  void update(void Function(AvailableTimesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AvailableTimesState build() {
    final _$result = _$v ??
        new _$AvailableTimesState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'AvailableTimesState', 'isLoading'),
            availableTimes: availableTimes);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
