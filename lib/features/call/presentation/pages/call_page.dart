import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_transform/sdp_transform.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_bloc.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_state.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../../../injection.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> with TickerProviderStateMixin {
  AnimationController? rotationController;
  final connectionBloc = sl<SignalRConnectionBloc>();
  FlutterTts tts = FlutterTts();
  bool isAnswered = false;
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();
  bool firstCandidateFetched = false;

  @override
  void initState() {
    initRenderer();
    _createPeerConnection().then((pc) {
      _peerConnection = pc;
    });
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    tts.awaitSpeakCompletion(true);
    rotationController!.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          rotationController!.reverse();
          break;
        case AnimationStatus.dismissed:
          rotationController!.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    rotationController!.forward();
    super.initState();
  }

  initRenderer() async {
    await _remoteRenderer.initialize();
  }

  @override
  void dispose() {
    _localStream!.dispose();
    _remoteRenderer.dispose();
    _peerConnection!.dispose();
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313F58),
      body: BlocListener(
        bloc: connectionBloc,
        listener: (context, SignalRConnectionState state) {
          if (state.isCallAccepted != null &&
              state.isCallAccepted! &&
              !isAnswered) {
            setState(() {
              isAnswered = true;
            });
            rotationController!.stop();
            tts.speak("تم قبول اتصالك من قبل المتطوع");
          }
          if (state.isCallAccepted != null && !state.isCallAccepted!) {
            tts.speak("قام المتطوع بإنهاء المكالمة");
            connectionBloc.resetCallAcceptance();
            Navigator.pop(context);
          }
          if (state.candidateData != null) {
            print("CANDIDATTTEEEE");
            _addCandidate(state.candidateData!);
            connectionBloc.resetCandidateData();
          }
          if (state.sdpData != null) {
            // _createPeerConnection().then((pc) {
            //   _peerConnection = pc;
            // });
            print("SDDPPPPPPP");
            _setRemoteDescription(state.sdpData!);
            connectionBloc.resetSdpData();
          }
        },
        child: BlocBuilder(
            bloc: connectionBloc,
            builder: (context, SignalRConnectionState state) {
              return WillPopScope(
                onWillPop: () {
                  connectionBloc.cancelCallRequest();
                  Navigator.pop(context);
                  return Future.value(true);
                },
                child: Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/oyooni_glasses.png',
                              scale: 7,
                            ),
                            Text(
                              state.isCallAccepted == null
                                  ? "جاري البحث عن متطوع..."
                                  : "المكالمة جارية",
                              style: TextStyle(
                                color: Color(0xFFF6964C),
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange.withOpacity(0.8),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6964C),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(15),
                                child: RotationTransition(
                                  turns: Tween(begin: -0.05, end: 0.05)
                                      .animate(rotationController!),
                                  child: Icon(
                                    Icons.local_phone_outlined,
                                    color: Color(0xFF313F58),
                                    size: 80,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      state.isCallAccepted == null
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                tts.speak("إنهاء المكالمة");
                              },
                              onDoubleTap: () {
                                connectionBloc.onHangUp();
                                tts.speak("إنهاء المكالمة");
                                Navigator.pop(context);
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6964C),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40)),
                                ),
                                child: Center(
                                  child: Text(
                                    "إنهاء المكالمة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF313F58),
                                      fontFamily: 'Roboto',
                                      fontSize: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  _createPeerConnection() async {
    Map<String, dynamic> configuration = {
      "iceServers": [
        {"url": "stun:stun1.l.google.com:19302"},
      ]
    };

    final Map<String, dynamic> offerSdpConstraints = {
      "mandatory": {
        "OfferToReceiveAudio": true,
        "OfferToReceiveVideo": false,
      },
      "optional": [],
      'sdpSemantics': 'plan-b'
    };

    _localStream = await _getUserMedia();

    RTCPeerConnection pc =
        await createPeerConnection(configuration, offerSdpConstraints);

    pc.addStream(_localStream!);

    print("pcccc is $pc");
    pc.onIceCandidate = (e) {
      if (e.candidate != null && !firstCandidateFetched) {
        final candidateData = json.encode({
          'candidate': e.candidate.toString(),
          'sdpMid': e.sdpMid.toString(),
          'sdpMlineIndex': e.sdpMlineIndex,
        });
        firstCandidateFetched = true;
        print("candidate data\n" + candidateData);

        connectionBloc.onSendSignal(candidateData);
      }
    };

    pc.onIceConnectionState = (e) {
      print(e);
    };

    pc.onAddStream = (stream) {
      print('addStream: ' + stream.id);
      _remoteRenderer.srcObject = stream;
    };

    return pc;
  }

  _getUserMedia() async {
    final Map<String, dynamic> constraints = {
      'audio': true,
      'video': {
        'facingMode': 'environment',
      },
    };

    MediaStream stream = await navigator.getUserMedia(constraints);

    // _localRenderer.srcObject = stream;
    // _localRenderer.mirror = true;

    return stream;
  }

  void _addCandidate(String candidateData) async {
    dynamic session = await jsonDecode('$candidateData');
    print(session['candidate']);
    dynamic candidate = new RTCIceCandidate(
        session['candidate'], session['sdpMid'], session['sdpMlineIndex']);
    await _peerConnection!.addCandidate(candidate);
  }

  void _createAnswer() async {
    RTCSessionDescription description = await _peerConnection!
        .createAnswer({'offerToReceiveAudio': 1, 'offerToReceiveVideo': 0});

    var session = parse(description.sdp.toString());
    print(json.encode(session));
    // print(json.encode({
    //       'sdp': description.sdp.toString(),
    //       'type': description.type.toString(),
    //     }));

    _peerConnection!.setLocalDescription(description);
    connectionBloc.onSendSignal(json.encode(session));
  }

  void _setRemoteDescription(String sdpData) async {
    dynamic session = await jsonDecode('$sdpData');

    String sdp = write(session, null);

    // RTCSessionDescription description =
    //     new RTCSessionDescription(session['sdp'], session['type']);
    RTCSessionDescription description = new RTCSessionDescription(sdp, 'offer');
    print(description.toMap());

    await _peerConnection!.setRemoteDescription(description);
    _createAnswer();
  }
}
