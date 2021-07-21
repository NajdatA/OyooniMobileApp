library signalr_connection_state;

import 'package:built_value/built_value.dart';
import 'package:signalr_client/hub_connection_builder.dart';

part 'signalr_connection_state.g.dart';

abstract class SignalRConnectionState implements Built<SignalRConnectionState, SignalRConnectionStateBuilder> {
  @nullable
  String get token;

  HubConnectionBuilder get hubConnectionBuilder;

  @nullable
  String get newVIId;

  @nullable
  String get cancelledVIId;

  @nullable
  String get message;

  @nullable
  String get visuallyImpairedDisconnectionMessage;

  bool get navigateToCallPage;

  @nullable
  bool get isCallAccepted;

  @nullable
  String get candidateData;

  @nullable
  String get sdpData;

  // @nullable
  // String get visuallyImpairedConnectionId;

  SignalRConnectionState._();

  factory SignalRConnectionState([updates(SignalRConnectionStateBuilder b)]) = _$SignalRConnectionState;

  factory SignalRConnectionState.initial() {
    return SignalRConnectionState((b) => b
        ..hubConnectionBuilder = HubConnectionBuilder()
        ..navigateToCallPage = false
    );
  }
}
