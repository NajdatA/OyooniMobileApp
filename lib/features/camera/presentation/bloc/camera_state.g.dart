// GENERATED CODE - DO NOT MODIFY BY HAND

part of camera_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CameraState extends CameraState {
  @override
  final bool isLoading;
  @override
  final String? recognizedText;
  @override
  final String? captionedImage;
  @override
  final String? recognizedBanknote;
  @override
  final String? recognizedColor;
  @override
  final ErrorCode? error;

  factory _$CameraState([void Function(CameraStateBuilder)? updates]) =>
      (new CameraStateBuilder()..update(updates)).build();

  _$CameraState._(
      {required this.isLoading,
      this.recognizedText,
      this.captionedImage,
      this.recognizedBanknote,
      this.recognizedColor,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'CameraState', 'isLoading');
  }

  @override
  CameraState rebuild(void Function(CameraStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CameraStateBuilder toBuilder() => new CameraStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CameraState &&
        isLoading == other.isLoading &&
        recognizedText == other.recognizedText &&
        captionedImage == other.captionedImage &&
        recognizedBanknote == other.recognizedBanknote &&
        recognizedColor == other.recognizedColor &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isLoading.hashCode), recognizedText.hashCode),
                    captionedImage.hashCode),
                recognizedBanknote.hashCode),
            recognizedColor.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CameraState')
          ..add('isLoading', isLoading)
          ..add('recognizedText', recognizedText)
          ..add('captionedImage', captionedImage)
          ..add('recognizedBanknote', recognizedBanknote)
          ..add('recognizedColor', recognizedColor)
          ..add('error', error))
        .toString();
  }
}

class CameraStateBuilder implements Builder<CameraState, CameraStateBuilder> {
  _$CameraState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _recognizedText;
  String? get recognizedText => _$this._recognizedText;
  set recognizedText(String? recognizedText) =>
      _$this._recognizedText = recognizedText;

  String? _captionedImage;
  String? get captionedImage => _$this._captionedImage;
  set captionedImage(String? captionedImage) =>
      _$this._captionedImage = captionedImage;

  String? _recognizedBanknote;
  String? get recognizedBanknote => _$this._recognizedBanknote;
  set recognizedBanknote(String? recognizedBanknote) =>
      _$this._recognizedBanknote = recognizedBanknote;

  String? _recognizedColor;
  String? get recognizedColor => _$this._recognizedColor;
  set recognizedColor(String? recognizedColor) =>
      _$this._recognizedColor = recognizedColor;

  ErrorCode? _error;
  ErrorCode? get error => _$this._error;
  set error(ErrorCode? error) => _$this._error = error;

  CameraStateBuilder();

  CameraStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _recognizedText = $v.recognizedText;
      _captionedImage = $v.captionedImage;
      _recognizedBanknote = $v.recognizedBanknote;
      _recognizedColor = $v.recognizedColor;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CameraState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CameraState;
  }

  @override
  void update(void Function(CameraStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CameraState build() {
    final _$result = _$v ??
        new _$CameraState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'CameraState', 'isLoading'),
            recognizedText: recognizedText,
            captionedImage: captionedImage,
            recognizedBanknote: recognizedBanknote,
            recognizedColor: recognizedColor,
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
