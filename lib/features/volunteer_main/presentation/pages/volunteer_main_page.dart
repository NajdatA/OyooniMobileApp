import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project/core/util/generate_screen.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_bloc.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_state.dart';
import 'package:senior_project/features/volunteer_main/presentation/bloc/volunteer_main_bloc.dart';
import 'package:senior_project/features/volunteer_main/presentation/bloc/volunteer_main_state.dart';
import 'package:senior_project/features/volunteer_main/presentation/widgets/incoming_call_card_widget.dart';
import 'package:senior_project/injection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VolunteerMainPage extends StatefulWidget {
  @override
  _VolunteerMainPageState createState() => _VolunteerMainPageState();
}

class _VolunteerMainPageState extends State<VolunteerMainPage> {
  final connectionBloc = sl<SignalRConnectionBloc>();
  final bloc = sl<VolunteerMainBloc>();

  @override
  void initState() {
    // print("volunteer main page init state");
    connectionBloc.onSetConnection(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: bloc,
        builder: (context, VolunteerMainState state) {
          return BlocListener(
            cubit: connectionBloc,
            listener: (context, SignalRConnectionState connectionState) {
              if (connectionState.newVIId != null) {
                bloc.onAddNewHelpRequest(connectionState.newVIId);
                connectionBloc.resetNewVIId();
              }
              if (connectionState.message != null) {
                Fluttertoast.showToast(msg: connectionState.message);
                connectionBloc.resetMessage();
              }
              if (connectionState.cancelledVIId != null) {
                bloc.onCancelHelpRequest(connectionState.cancelledVIId);
                connectionBloc.resetCancelHelpRequest();
              }
              if (connectionState.visuallyImpairedDisconnectionMessage != null) {
                print("hahaha");
                Navigator.pop(context);
                Fluttertoast.showToast(msg: connectionState.visuallyImpairedDisconnectionMessage);
                connectionBloc.resetVIDisconnectionMessage();
              }
            },
            child: BlocBuilder(
                cubit: connectionBloc,
                builder: (context, SignalRConnectionState connectionState) {
                  return Scaffold(
                    backgroundColor: Colors.orange[50],
                    appBar: AppBar(
                      backgroundColor: Color(0xFF313F58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20),),
                      ),
                      // backgroundColor: Colors.blue[300],
                      title: Text(
                        "الصفحة الرئيسية",
                        style: TextStyle(
                          color: Color(0xFFF6964C),
                          // fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                      automaticallyImplyLeading: false,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF313F58),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(-1, -1)),
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 1)),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NameScreen.AVAILABLE_TIMES_PAGE);
                              },
                              child: Icon(
                                Icons.access_time,
                                color: Color(0xFFF6964C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: state.users
                          .map((e) => IncomingCallCardWidget(id: e, bloc: connectionBloc,))
                          .toList(),
                      // [
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:01:02",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:05:02",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:00:02",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:01:16",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:02:02",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:00:52",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:00:32",
                      //   ),
                      //   IncomingCallCardWidget(
                      //     waitTime: "00:01:02",
                      //   ),
                      // ],
                    ),
                  );
                }),
          );
        });
  }
}
