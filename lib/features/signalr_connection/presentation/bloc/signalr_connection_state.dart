library signalr_connection_state;

import 'package:built_value/built_value.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

part 'signalr_connection_state.g.dart';

abstract class SignalRConnectionState implements Built<SignalRConnectionState, SignalRConnectionStateBuilder> {
  String? get token;

  HubConnectionBuilder get hubConnectionBuilder;

  String? get newVIId;

  String? get cancelledVIId;

  String? get message;

  String? get visuallyImpairedDisconnectionMessage;

  bool get navigateToCallPage;

  bool? get isCallAccepted;

  String? get candidateData;

  String? get sdpData;

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
