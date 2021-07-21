import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';
import 'package:senior_project/features/available_times/presentation/bloc/available_times_bloc.dart';
import 'package:senior_project/features/available_times/presentation/bloc/available_times_state.dart';
import 'package:senior_project/injection.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AvailableTimesPage extends StatefulWidget {
  const AvailableTimesPage({Key key}) : super(key: key);

  @override
  _AvailableTimesPageState createState() => _AvailableTimesPageState();
}

class _AvailableTimesPageState extends State<AvailableTimesPage> {
  final bloc = sl<AvailableTimesBloc>();

  @override
  void initState() {
    bloc.onAvailableTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF313F58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20),),
        ),
        // backgroundColor: Colors.blue[300],
        title: Text(
          "أوقات التواجد",
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
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xFFF6964C),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder(
          cubit: bloc,
          builder: (context, AvailableTimesState state) {
            // if (state.isLoading) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return Stack(
              children: [
                ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(offset: Offset(0,02),
                              spreadRadius: 0.4,
                              blurRadius: 1,
                              color: Color(0xFF313F58).withOpacity(0.3),)
                            ]
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                accentColor: Color(0xFFF6964C),
                                unselectedWidgetColor: Color(0xFFF6964C)),
                            child: ExpansionTile(
                              leading: GestureDetector(
                                onTap: () async {
                                  final from = await showTimePicker(
                                    helpText: "وقت الدخول",
                                    context: context,
                                    initialTime:
                                        TimeOfDay(hour: 00, minute: 00),
                                  );
                                  // print("from is $from");
                                  final to = await showTimePicker(
                                    helpText: "وقت الخروج",
                                    context: context,
                                    initialTime:
                                        TimeOfDay(hour: 00, minute: 00),
                                  );
                                  // print("to is $to");
                                  if (to == null || from == null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "عليك تحديد وفت البدأ والانتهاء قبل المتابعة");
                                  } else if (to.hour < from.hour ||
                                      (to.hour == from.hour &&
                                          to.minute < from.minute)) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "لا يجب أن يكون وقت الانتهاء قبل وقت الدخول");
                                  } else {
                                    await showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          backgroundColor: Colors.orange[200],
                                          contentPadding: EdgeInsets.zero,
                                          actions: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                                bloc.onAddTime(index, from.hour.toString()+":"+from.minute.toString(), to.hour.toString()+":"+to.minute.toString());
                                              },
                                              child: Container(
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Color(0xFF145577),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2),
                                                child: Text(
                                                  "نعم",
                                                  style: TextStyle(
                                                    color: Colors.orange[200],
                                                    fontSize: 17,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                    color: Color(0xFF145577),
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2),
                                                child: Text(
                                                  "لا",
                                                  style: TextStyle(
                                                    color: Color(0xFF145577),
                                                    fontSize: 17,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20),
                                              Text(
                                                "هل متأكد من هذه العملية؟",
                                                style: TextStyle(
                                                  color: Color(0xFF145577),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    from.format(context),
                                                    style: TextStyle(
                                                      color: Color(0xFF145577),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  Text(
                                                    '-',
                                                    style: TextStyle(
                                                      color: Color(0xFF145577),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                  Text(
                                                    to.format(context),
                                                    style: TextStyle(
                                                      color: Color(0xFF145577),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  }
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFFF6964C),
                                ),
                              ),
                              title: Text(
                                indexToDay(index),
                                style: TextStyle(
                                  color: Color(0xFFF6964C),
                                ),
                              ),
                              children: indexToTimes(index, state) == null
                                  ? [
                                      Text(
                                        "لا يوجد أوقات",
                                        style: TextStyle(
                                          color: Color(0xFF313F58),
                                          fontSize: 20,
                                        ),
                                      )
                                    ]
                                  : indexToTimes(index, state)
                                      .map((e) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                e.from,
                                                style: TextStyle(
                                                  color: Color(0xFF145577),
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                '-',
                                                style: TextStyle(fontSize: 40, color: Color(0xFF145577),),
                                              ),
                                              Text(
                                                e.to,
                                                style: TextStyle(
                                                  color: Color(0xFF145577),
                                                  fontSize: 15,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  bloc.onDeleteTime(
                                                      e.id, index);
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red[400],
                                                ),
                                              )
                                            ],
                                          ))
                                      .toList(),
                            ),
                          ),
                        ),
                      );
                    }),
                if (state.isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          }),
    );
  }
}

String indexToDay(int index) {
  switch (index) {
    case 0:
      return "الأحد";
    case 1:
      return "الاتنين";
    case 2:
      return "الثلاثاء";
    case 3:
      return "الأربعاء";
    case 4:
      return "الخميس";
    case 5:
      return "الجمعة";
    case 6:
      return "السبت";
  }
}

List<TimesEntity> indexToTimes(int index, AvailableTimesState state) {
  switch (index) {
    case 0:
      return state.availableTimes == null ? [] : state.availableTimes.sun;
    case 1:
      return state.availableTimes == null ? [] : state.availableTimes.mon;
    case 2:
      return state.availableTimes == null ? [] : state.availableTimes.tues;
    case 3:
      return state.availableTimes == null ? [] : state.availableTimes.wed;
    case 4:
      return state.availableTimes == null ? [] : state.availableTimes.thurs;
    case 5:
      return state.availableTimes == null ? [] : state.availableTimes.fri;
    case 6:
      return state.availableTimes == null ? [] : state.availableTimes.sat;
  }
}
