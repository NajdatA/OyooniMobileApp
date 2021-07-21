import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senior_project/core/util/generate_screen.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_bloc.dart';

class IncomingCallCardWidget extends StatefulWidget {
  final String id;
  final SignalRConnectionBloc bloc;

  const IncomingCallCardWidget({Key key, this.id, this.bloc}) : super(key: key);

  @override
  _IncomingCallCardWidgetState createState() => _IncomingCallCardWidgetState();
}

class _IncomingCallCardWidgetState extends State<IncomingCallCardWidget> {
  Timer timer;
  int time = 0;
  String waitTime = '00:00';

  @override
  void initState() {
    // setState(() {
    //   time = int.parse(waitTime.substring(3, 5)) > 4
    //       ? 255
    //       : ((int.parse(waitTime.substring(6))) +
    //           (int.parse(waitTime.substring(3, 5)) * 60));
    // });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time < 255) {
        setState(() {
          // print("time is $time");
          time++;
          if (time<10) {
            waitTime = '00:0$time';
          } else if (time<60) {
            waitTime = '00:$time';
          } else {
            waitTime = '${time~/60 < 10 ? '0'+(time~/60).toString() : time~/60}:${time%60 < 10 ? '0'+(time%60).toString() : time%60}';
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          widget.bloc.acceptCall(widget.id);
          Navigator.pushNamed(context, NameScreen.VIDEO_CALL_PAGE, arguments: {"id": widget.id});
        },
        child: Container(
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            // color: Colors.orange[50],
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.orange[50]],
              stops: [0.2, 0.4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(-1, -1)),
              BoxShadow(
                  color: Colors.orange[100],
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(2, 2)),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.face,
                size: 150,
                color: Color(0xFF145577).withOpacity(0.4),
              ),
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(time, 255 - time, 0, 0.3),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الوقت المنتظر",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      waitTime,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
