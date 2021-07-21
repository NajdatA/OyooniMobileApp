import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/signalr_connection/domain/usecase/get_token.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_event.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_state.dart';
import 'package:signalr_client/http_connection_options.dart';
import 'package:signalr_client/hub_connection.dart';
import 'package:signalr_client/hub_connection_builder.dart';

class SignalRConnectionBloc
    extends Bloc<SignalRConnectionEvent, SignalRConnectionState> {
  // final hubConnectionBuilder = HubConnectionBuilder();
  final GetToken getToken;
  HubConnection connection;

  SignalRConnectionBloc(this.getToken)
      : super(SignalRConnectionState.initial());

  /// Volunteer methods
  void onSetConnection(bool isVI) {
    add(SetConnectionEvent(isVI));
  }

  void resetNewVIId() {
    add(ResetNewVIIdEvent());
  }

  void onAddNewVIId(String id) {
    add(AddNewVIIdEvent(id));
  }

  void showMessage(String message) {
    add(MessageEvent(message));
  }

  void resetMessage() {
    add(ResetMessageEvent());
  }

  void onRemoveHelpRequest(String id) {
    add(CancelHelpRequestEvent(id));
  }

  void resetCancelHelpRequest() {
    add(ResetCancelHelpRequestEvent());
  }

  void onVIEndCall(String message) {
    add(VIEndCallEvent(message));
  }

  void resetVIDisconnectionMessage() {
    add(ResetVIDisconnectionMessageEvent());
  }

  void acceptCall(String id) {
    add(AcceptCallEvent(id));
  }

  void onHangUp() {
    add(HangUpEvent());
  }

  /// VI methods
  void onRequestCall() {
    add(RequestCallingEvent());
  }

  void resetNavigateToCallPage() {
    add(ResetNavigateToCallPageEvent());
  }

  void cancelCallRequest() {
    add(CancelCallRequestEvent());
  }

  void onVolunteerAcceptedCall(String volunteerConnectionId) {
    add(VolunteerAcceptedCallEvent(volunteerConnectionId));
  }

  void onVolunteerHungUp() {
    add(VolunteerHungUpEvent());
  }

  void resetCallAcceptance() {
    add(ResetCallAcceptanceEvent());
  }

  void onSendSignal(String data) {
    add(SendSignalEvent(data));
  }

  void onReceiveSignal(String data) {
    add(ReceiveSignalEvent(data));
  }

  void resetSdpData() {
    add(ResetSdpDataEvent());
  }
  void resetCandidateData() {
    add(ResetCandidateDataEvent());
  }

  void onAddVIConnectionId(String id) {
    add(AddVIConnectionIdEvent(id));
  }

  @override
  Stream<SignalRConnectionState> mapEventToState(
      SignalRConnectionEvent event) async* {
    print('${event.toString()}');
    if (event is SetConnectionEvent) {
      yield* setConnectionOrFailure(event, state);
    } else if (event is ResetNewVIIdEvent) {
      yield state.rebuild((b) => b..newVIId = null);
    } else if (event is AddNewVIIdEvent) {
      yield state.rebuild((b) => b..newVIId = event.id);
    } else if (event is MessageEvent) {
      yield state.rebuild((b) => b..message = event.message);
    } else if (event is ResetMessageEvent) {
      yield state.rebuild((b) => b..message = null);
    } else if (event is CancelHelpRequestEvent) {
      yield state.rebuild((b) => b..cancelledVIId = event.id);
    } else if (event is ResetCancelHelpRequestEvent) {
      yield state.rebuild((b) => b..cancelledVIId = null);
    } else if (event is VIEndCallEvent) {
      yield state.rebuild((b) => b
        ..visuallyImpairedDisconnectionMessage = event.message
        ..isCallAccepted = null);
    } else if (event is ResetVIDisconnectionMessageEvent) {
      yield state
          .rebuild((b) => b..visuallyImpairedDisconnectionMessage = null);
    } else if (event is AcceptCallEvent) {
      yield* acceptVICall(event, state);
    } else if (event is HangUpEvent) {
      final hangingUp = await connection.invoke(ServerMethods.hangUp);
      print("Hanging up is $hangingUp");
      onVIEndCall(Responses.viEndedCall);
    } else if (event is RequestCallingEvent) {
      final isRequested =
          await connection.invoke(ServerMethods.requestVolunteerHelp);
      print("is requested $isRequested");
      yield state.rebuild((b) => b..navigateToCallPage = true);
    } else if (event is ResetNavigateToCallPageEvent) {
      yield state.rebuild((b) => b..navigateToCallPage = false);
    } else if (event is CancelCallRequestEvent) {
      final hangingUp = await connection.invoke(ServerMethods.hangUp);
      print("Hanging up is $hangingUp");
    } else if (event is VolunteerAcceptedCallEvent) {
      yield state.rebuild((b) => b..isCallAccepted = true);
    } else if (event is VolunteerHungUpEvent) {
      yield state.rebuild((b) => b..isCallAccepted = false);
    } else if (event is ResetCallAcceptanceEvent) {
      yield state.rebuild((b) => b..isCallAccepted = null);
    } else if (event is SendSignalEvent) {
      print("data to send on send signal is ${event.data}");
      final response = await connection.invoke(ServerMethods.sendSignal, args: [
        event.data,
      ]);
      print('signal response is $response');
    } else if (event is ReceiveSignalEvent) {
      final Map<String, dynamic> decodedData = json.decode(event.data);
      print(decodedData);
      if (decodedData.keys.contains("candidate")) {
        yield state.rebuild((b) => b..candidateData = json.encode(decodedData));
      } else {
        yield state.rebuild((b) => b..sdpData = json.encode(decodedData));
      }
    } else if (event is ResetSdpDataEvent) {
      yield state.rebuild((b) => b..sdpData = null);
    } else if (event is ResetCandidateDataEvent) {
      yield state.rebuild((b) => b..candidateData = null);
    } else if (event is AddVIConnectionIdEvent) {
      print("connection id is set to ${event.id}");
      // yield state.rebuild((b) => b..visuallyImpairedConnectionId = event.id);
    }
  }

  Stream<SignalRConnectionState> setConnectionOrFailure(
    SetConnectionEvent event,
    SignalRConnectionState state,
  ) async* {
    if (event.isVI) {
      yield state.rebuild(
        (b) => b
          ..hubConnectionBuilder = b.hubConnectionBuilder.withUrl(
            Endpoints.SOCKET_URL,
          ),
      );
      print("hub connection ${state.hubConnectionBuilder}");
      connection = state.hubConnectionBuilder.build();
      await connection.start();

      print("VI is connected");
      visuallyImpairedEvents(connection);
    } else {
      final result = await getToken(NoParams());
      yield* result.fold((l) => null, (r) async* {
        yield state.rebuild(
          (b) => b
            ..hubConnectionBuilder = b.hubConnectionBuilder.withUrl(
              Endpoints.SOCKET_URL,
              options: HttpConnectionOptions(
                accessTokenFactory: () async {
                  return r;
                },
              ),
            ),
        );
      });
      print("hub connection ${state.hubConnectionBuilder}");
      connection = state.hubConnectionBuilder.build();
      await connection.start();
      volunteerEvents(connection);
    }
  }

  Stream<SignalRConnectionState> acceptVICall(
    AcceptCallEvent event,
    SignalRConnectionState state,
  ) async* {
    final isAccepted =
        await connection.invoke(ServerMethods.acceptCall, args: [event.id]);
    print("is accepted $isAccepted");
  }

  volunteerEvents(HubConnection connection) {
    /// New VI Requested a call
    connection.on(ServerEvents.newVINeedingHelp, (arguments) {
      print("new vi");
      print("new vi id is ${arguments[0]}");
      onAddNewVIId(arguments[0]);
    });

    /// Error Occurred
    connection.on(ServerEvents.error, (arguments) {
      showMessage(arguments[0]);
    });

    /// Cancelled Help Request
    connection.on(ServerEvents.cancelledHelpRequest, (arguments) {
      print("cancel");
      onRemoveHelpRequest(arguments[0]);
    });

    /// VI Disconnected
    connection.on(ServerEvents.viDisconnected, (arguments) {
      print('vi disconnected');
      onRemoveHelpRequest(arguments[0]);
    });

    /// VI found a volunteer
    connection.on(ServerEvents.viAcceptedByVolunteer, (arguments) {
      print('vi found a caller 2');
      onRemoveHelpRequest(arguments[0]);
    });

    /// Already in a call
    connection.on(ServerEvents.alreadyInCall, (arguments) {
      print('vi found a caller');
      onRemoveHelpRequest(arguments[0]);
    });

    /// Visually Impaired Disconnected
    connection.on(ServerEvents.viDisconnected, (arguments) {
      onVIEndCall(Responses.viEndedCall);
    });

    /// Visually Impaired Hang up
    connection.on(ServerEvents.viHasHungUp, (arguments) {
      onVIEndCall(Responses.viEndedCall);
    });

    /// Volunteer Received Signal
    connection.on(ServerEvents.receivedSignal, (arguments) {
      onReceiveSignal(arguments[0]);
    });
  }

  visuallyImpairedEvents(HubConnection connection) {
    /// Connected Successfully
    connection.on(ServerEvents.connectedSuccessfully, (arguments) {
      print("connected successfully");
      onAddVIConnectionId(arguments[0]);
    });

    /// Volunteer Accepted Call
    connection.on(ServerEvents.volunteerAcceptedCall, (arguments) {
      onVolunteerAcceptedCall(arguments[0]);
    });

    /// Volunteer Hung Up
    connection.on(ServerEvents.volunteerHasHungUp, (arguments) {
      onVolunteerHungUp();
    });

    /// Volunteer DisConnected
    connection.on(ServerEvents.volunteerDisconnected, (arguments) {
      onVolunteerHungUp();
    });

    /// Receive Signal
    connection.on(ServerEvents.receivedSignal, (arguments) {
      onReceiveSignal(arguments[0]);
    });
  }
}
