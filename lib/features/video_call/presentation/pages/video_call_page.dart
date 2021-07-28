import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_bloc.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_state.dart';
import 'package:senior_project/injection.dart';

class VideoCallPage extends StatefulWidget {
  final String id;

  const VideoCallPage({Key? key, required this.id}) : super(key: key);

  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  final bloc = sl<SignalRConnectionBloc>();

  // bool _offer = false;
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();

  // String session;
  bool firstCandidateFetched = false;

  @override
  void initState() {
    initRenderer();
    _createPeerConnection().then((pc) {
      _peerConnection = pc;
      _createOffer();
    });
    super.initState();
  }

  initRenderer() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
    _remoteRenderer.delegate.audioOutput('');
  }

  @override
  void dispose() {
    _localStream!.dispose();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    _peerConnection!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        listener: (context, SignalRConnectionState state) {
          if (state.sdpData != null) {
            print("SDDPPPP");
            _setRemoteDescription(state.sdpData!);
            bloc.resetSdpData();
          }
          if (state.candidateData != null) {
            print("CANDIDATTTEEEE");
            _addCandidate(state.candidateData!);
            bloc.resetCandidateData();
          }
        },
        bloc: bloc,
        child: Column(
          children: [
            Expanded(child: RTCVideoView(_remoteRenderer, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,)),
            GestureDetector(
              onTap: () {
                bloc.onHangUp();
              },
              child: Container(
                width: double.maxFinite,
                color: Color(0xFFFF8238),
                padding: EdgeInsets.all(10),
                child: Text(
                  "إنهاء المكالمة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1A3061),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _createPeerConnection() async {
    Map<String, dynamic> configuration = {
      "iceServers": [
        {"url": "stun:stun1.l.google.com:19302",},
      ]
    };

    final Map<String, dynamic> offerSdpConstraints = {
      "mandatory": {
        "OfferToReceiveAudio": true,
        "OfferToReceiveVideo": true,
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

        bloc.onSendSignal(candidateData);
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

  void _addCandidate(String candidateData) async {
    dynamic session = await jsonDecode('$candidateData');
    print(session['candidate']);
    dynamic candidate = new RTCIceCandidate(
        session['candidate'], session['sdpMid'], session['sdpMlineIndex']);
    await _peerConnection!.addCandidate(candidate);
    setState(() {});
  }

  _getUserMedia() async {
    final Map<String, dynamic> constraints = {
      'audio': true,
      'video': {
        'facingMode': 'environment',
      },
    };

    MediaStream stream = await navigator.mediaDevices.getUserMedia(constraints);

    _localRenderer.srcObject = stream;
    // _localRenderer.mirror = true;

    return stream;
  }

  void _createOffer() async {
    print("create offer");
    RTCSessionDescription description =
        await _peerConnection!.createOffer({'offerToReceiveVideo': 1});
    var s = parse(description.sdp.toString());
    print("session is " + json.encode(s));
    // _offer = true;

    // print(json.encode({
    //       'sdp': description.sdp.toString(),
    //       'type': description.type.toString(),
    //     }));

    _peerConnection!.setLocalDescription(description);
    // session = json.encode(s);
    bloc.onSendSignal(json.encode(s));
  }

  void _setRemoteDescription(String jsonString) async {
    dynamic session = await jsonDecode('$jsonString');

    String sdp = write(session, null);

    // RTCSessionDescription description =
    //     new RTCSessionDescription(session['sdp'], session['type']);
    RTCSessionDescription description = new RTCSessionDescription(
        sdp,
        // _offer ? 'answer' :
        'answer');
    print(description.toMap());

    await _peerConnection!.setRemoteDescription(description);
    setState(() {});
  }
}
