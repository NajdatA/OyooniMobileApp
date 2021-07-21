import 'package:signalr_client/hub_connection.dart';

abstract class SignalRConnectionEvent {}

class SetConnectionEvent extends SignalRConnectionEvent {
  final bool isVI;

  SetConnectionEvent(this.isVI);

}
class ResetNewVIIdEvent extends SignalRConnectionEvent {}
class AddNewVIIdEvent extends SignalRConnectionEvent {
  final String id;

  AddNewVIIdEvent(this.id);
}
class MessageEvent extends SignalRConnectionEvent {
  final String message;

  MessageEvent(this.message);
}
class ResetMessageEvent extends SignalRConnectionEvent {}
class CancelHelpRequestEvent extends SignalRConnectionEvent {
  final String id;

  CancelHelpRequestEvent(this.id);
}
class ResetCancelHelpRequestEvent extends SignalRConnectionEvent {}
class VIEndCallEvent extends SignalRConnectionEvent {
  final String message;

  VIEndCallEvent(this.message);
}
class ResetVIDisconnectionMessageEvent extends SignalRConnectionEvent {}
class AcceptCallEvent extends SignalRConnectionEvent {
  final String id;

  AcceptCallEvent(this.id);
}
class HangUpEvent extends SignalRConnectionEvent {}
class RequestCallingEvent extends SignalRConnectionEvent {}
class ResetNavigateToCallPageEvent extends SignalRConnectionEvent {}
class CancelCallRequestEvent extends SignalRConnectionEvent {}
class VolunteerAcceptedCallEvent extends SignalRConnectionEvent {
  final String volunteerConnectionId;

  VolunteerAcceptedCallEvent(this.volunteerConnectionId);
}
class VolunteerHungUpEvent extends SignalRConnectionEvent {}
class ResetCallAcceptanceEvent extends SignalRConnectionEvent {}
class SendSignalEvent extends SignalRConnectionEvent {
  final String data;

  SendSignalEvent(this.data);
}
class ReceiveSignalEvent extends SignalRConnectionEvent {
  final String data;

  ReceiveSignalEvent(this.data);
}
class ResetSdpDataEvent extends SignalRConnectionEvent {}
class ResetCandidateDataEvent extends SignalRConnectionEvent {}
class AddVIConnectionIdEvent extends SignalRConnectionEvent {
  final String id;

  AddVIConnectionIdEvent(this.id);
}
