// GENERATED CODE - DO NOT MODIFY BY HAND

part of signalr_connection_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignalRConnectionState extends SignalRConnectionState {
  @override
  final String token;
  @override
  final HubConnectionBuilder hubConnectionBuilder;
  @override
  final String newVIId;
  @override
  final String cancelledVIId;
  @override
  final String message;
  @override
  final String visuallyImpairedDisconnectionMessage;
  @override
  final bool navigateToCallPage;
  @override
  final bool isCallAccepted;
  @override
  final String candidateData;
  @override
  final String sdpData;

  factory _$SignalRConnectionState(
          [void Function(SignalRConnectionStateBuilder) updates]) =>
      (new SignalRConnectionStateBuilder()..update(updates)).build();

  _$SignalRConnectionState._(
      {this.token,
      this.hubConnectionBuilder,
      this.newVIId,
      this.cancelledVIId,
      this.message,
      this.visuallyImpairedDisconnectionMessage,
      this.navigateToCallPage,
      this.isCallAccepted,
      this.candidateData,
      this.sdpData})
      : super._() {
    if (hubConnectionBuilder == null) {
      throw new BuiltValueNullFieldError(
          'SignalRConnectionState', 'hubConnectionBuilder');
    }
    if (navigateToCallPage == null) {
      throw new BuiltValueNullFieldError(
          'SignalRConnectionState', 'navigateToCallPage');
    }
  }

  @override
  SignalRConnectionState rebuild(
          void Function(SignalRConnectionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignalRConnectionStateBuilder toBuilder() =>
      new SignalRConnectionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignalRConnectionState &&
        token == other.token &&
        hubConnectionBuilder == other.hubConnectionBuilder &&
        newVIId == other.newVIId &&
        cancelledVIId == other.cancelledVIId &&
        message == other.message &&
        visuallyImpairedDisconnectionMessage ==
            other.visuallyImpairedDisconnectionMessage &&
        navigateToCallPage == other.navigateToCallPage &&
        isCallAccepted == other.isCallAccepted &&
        candidateData == other.candidateData &&
        sdpData == other.sdpData;
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
                                    $jc($jc(0, token.hashCode),
                                        hubConnectionBuilder.hashCode),
                                    newVIId.hashCode),
                                cancelledVIId.hashCode),
                            message.hashCode),
                        visuallyImpairedDisconnectionMessage.hashCode),
                    navigateToCallPage.hashCode),
                isCallAccepted.hashCode),
            candidateData.hashCode),
        sdpData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignalRConnectionState')
          ..add('token', token)
          ..add('hubConnectionBuilder', hubConnectionBuilder)
          ..add('newVIId', newVIId)
          ..add('cancelledVIId', cancelledVIId)
          ..add('message', message)
          ..add('visuallyImpairedDisconnectionMessage',
              visuallyImpairedDisconnectionMessage)
          ..add('navigateToCallPage', navigateToCallPage)
          ..add('isCallAccepted', isCallAccepted)
          ..add('candidateData', candidateData)
          ..add('sdpData', sdpData))
        .toString();
  }
}

class SignalRConnectionStateBuilder
    implements Builder<SignalRConnectionState, SignalRConnectionStateBuilder> {
  _$SignalRConnectionState _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  HubConnectionBuilder _hubConnectionBuilder;
  HubConnectionBuilder get hubConnectionBuilder => _$this._hubConnectionBuilder;
  set hubConnectionBuilder(HubConnectionBuilder hubConnectionBuilder) =>
      _$this._hubConnectionBuilder = hubConnectionBuilder;

  String _newVIId;
  String get newVIId => _$this._newVIId;
  set newVIId(String newVIId) => _$this._newVIId = newVIId;

  String _cancelledVIId;
  String get cancelledVIId => _$this._cancelledVIId;
  set cancelledVIId(String cancelledVIId) =>
      _$this._cancelledVIId = cancelledVIId;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _visuallyImpairedDisconnectionMessage;
  String get visuallyImpairedDisconnectionMessage =>
      _$this._visuallyImpairedDisconnectionMessage;
  set visuallyImpairedDisconnectionMessage(
          String visuallyImpairedDisconnectionMessage) =>
      _$this._visuallyImpairedDisconnectionMessage =
          visuallyImpairedDisconnectionMessage;

  bool _navigateToCallPage;
  bool get navigateToCallPage => _$this._navigateToCallPage;
  set navigateToCallPage(bool navigateToCallPage) =>
      _$this._navigateToCallPage = navigateToCallPage;

  bool _isCallAccepted;
  bool get isCallAccepted => _$this._isCallAccepted;
  set isCallAccepted(bool isCallAccepted) =>
      _$this._isCallAccepted = isCallAccepted;

  String _candidateData;
  String get candidateData => _$this._candidateData;
  set candidateData(String candidateData) =>
      _$this._candidateData = candidateData;

  String _sdpData;
  String get sdpData => _$this._sdpData;
  set sdpData(String sdpData) => _$this._sdpData = sdpData;

  SignalRConnectionStateBuilder();

  SignalRConnectionStateBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _hubConnectionBuilder = _$v.hubConnectionBuilder;
      _newVIId = _$v.newVIId;
      _cancelledVIId = _$v.cancelledVIId;
      _message = _$v.message;
      _visuallyImpairedDisconnectionMessage =
          _$v.visuallyImpairedDisconnectionMessage;
      _navigateToCallPage = _$v.navigateToCallPage;
      _isCallAccepted = _$v.isCallAccepted;
      _candidateData = _$v.candidateData;
      _sdpData = _$v.sdpData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignalRConnectionState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignalRConnectionState;
  }

  @override
  void update(void Function(SignalRConnectionStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignalRConnectionState build() {
    final _$result = _$v ??
        new _$SignalRConnectionState._(
            token: token,
            hubConnectionBuilder: hubConnectionBuilder,
            newVIId: newVIId,
            cancelledVIId: cancelledVIId,
            message: message,
            visuallyImpairedDisconnectionMessage:
                visuallyImpairedDisconnectionMessage,
            navigateToCallPage: navigateToCallPage,
            isCallAccepted: isCallAccepted,
            candidateData: candidateData,
            sdpData: sdpData);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
