import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:senior_project/core/util/app_localizations.dart';
import 'package:senior_project/core/util/generate_screen.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_bloc.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_state.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:senior_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:senior_project/features/home/presentation/bloc/home_state.dart';
import 'package:senior_project/injection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  FlutterTts tts = FlutterTts();
  stt.SpeechToText speech = stt.SpeechToText();
  final bloc = sl<HomeBloc>();
  final connectionBloc = sl<SignalRConnectionBloc>();
  bool isTalking = false;
  bool requestedToNavigate = false;

  AnimationController? _animationController;
  Animation? _colorTween;

  @override
  void initState() {
    tts.setLanguage('ar');
    connectionBloc.onSetConnection(true);
    tts.awaitSpeakCompletion(true);
    // bloc.onScreenAppeared();
    _animationController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );
    _colorTween = ColorTween(begin: Color(0xFF145577), end: Color(0xFFFF8238))
        .animate(_animationController!);
    _animationController!.addStatusListener((animationStatus) {
      print("aaaa $animationStatus");
      switch (animationStatus) {
        case AnimationStatus.completed:
          _animationController!.reverse();
          break;
        case AnimationStatus.dismissed:
          _animationController!.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    // _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF313F58),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener(
            bloc: connectionBloc,
            listener: (context, SignalRConnectionState state) {
              if (state.navigateToCallPage && !requestedToNavigate) {
                setState(() {
                  requestedToNavigate = true;
                });
                connectionBloc.resetNavigateToCallPage();
                Navigator.pushNamed(context, NameScreen.CALL_PAGE);
                Future.delayed(Duration(milliseconds: 1000), () {
                  setState(() {
                    requestedToNavigate = false;
                  });
                });
              }
            },
            child: BlocBuilder(
              bloc: connectionBloc,
              builder: (context, SignalRConnectionState state) {
                return BlocBuilder(
                    bloc: bloc,
                    builder: (context, HomeState state) {
                      if (state.language != null && state.language != "") {
                        tts.setLanguage(state.language!);
                        // runSpeech(
                        //   [
                        //     AppLocalizations.of(context).translate("screen_size_button"),
                        //     AppLocalizations.of(context).translate("list_of_commands"),
                        //     AppLocalizations.of(context).translate("command1"),
                        //     AppLocalizations.of(context).translate("command1_info"),
                        //     AppLocalizations.of(context).translate("command2"),
                        //     AppLocalizations.of(context).translate("command2_info"),
                        //   ], tts
                        // );
                        runTts();
                      }
                      return GestureDetector(
                        onTap: () {
                          if (isTalking) {
                            tts.stop();
                            setState(() {
                              isTalking = false;
                            });
                          } else
                          runTts();
                        },
                        onDoubleTap: () async {
                          if (isTalking) {
                            tts.stop();
                            setState(() {
                              isTalking = false;
                            });
                          }
                          await speech.stop();
                          await speech.initialize(
                              onStatus: (s) {
                                print('status is $s');
                                _animationController!.forward();
                              }, onError: (e) {
                            print('e is $e');
                            _animationController!.reset();
                            _animationController!.stop();
                          }).then((value) => speech.listen(
                            onResult: (r) async {
                              _animationController!.reset();
                              _animationController!.stop();
                              print('result is $r');
                              if (r.recognizedWords == "كاميرا") {
                                Navigator.pushNamed(context, NameScreen.CAMERA_PAGE);
                                await tts.speak("تم اختيار صقحة الكاميرا");
                              }
                              if (r.recognizedWords == "تعليمات") {
                                setState(() {
                                  isTalking = true;
                                });
                                await tts.speak("التعليمات المتاحة في صفحة الكاميرا هي");
                                await tts.speak("ماذا أرى");
                                await tts.speak("للاستعلام على ما يوجد أمامي");
                                await tts.speak("النص");
                                await tts.speak("لقراءة لافتة أو جملة ما");
                                await tts.speak("وثيقة");
                                await tts.speak("لقراءة وثيقة او استمارة");
                                await tts.speak("نقود");
                                await tts.speak("للتعرف على نوع الليرة السورية المحمولة");
                                await tts.speak("الوان");
                                await tts.speak("للتعرف على اللو المهيمن في الصورة");
                                setState(() {
                                  isTalking = false;
                                });
                              }
                              if (r.recognizedWords == "اتصال") {
                                connectionBloc.onRequestCall();
                                // Navigator.pushNamed(context, NameScreen.CALL_PAGE);
                                await tts.speak("تم اختيار اتصال");
                              }
                            },
                            localeId: "ar",
                          ));
                        },
                        child: AnimatedBuilder(
                          animation: _colorTween!,
                          builder: (context, child) {
                            return Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  colors: [
                                    _colorTween!.value.withOpacity(0.1),
                                    _colorTween!.value.withOpacity(0.2),
                                    _colorTween!.value.withOpacity(0.3),
                                    _colorTween!.value.withOpacity(0.4),
                                  ],
                                  // colors: [Color(0xFF222288), Color(0xFF111166), Color(0xFF111155), Color(0xFF111144)],
//                           colors: [Color(0xFFFFFFFF), Color(0xFFEEEEEE), Color(0xFFDDDDDD), Color(0xFFBBBBBB)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0, 0.2, 0.4, 0.9],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 4),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    color: Color(0xFF111111).withOpacity(0.2),
                                  ),
                                ],
                                // border: Border.all(color: Colors.orange, width: _resizableController.value * 10)
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('assets/images/oyooni_glasses.png', scale: 7,),
                                  Text(
                                    AppLocalizations.of(context).translate("screen_size_button"),
                                    style: TextStyle(
                                      color: Color(0xFFF6964C),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF6964C),
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppLocalizations.of(context).translate("list_of_commands"),
                                      style: TextStyle(
                                        color: Color(0xFFF6964C),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "\u2022 كاميرا\n\u2022 تعليمات الكاميرا\n\u2022 اتصال",
                                      style: TextStyle(
                                        color: Color(0xFFF6964C),
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        ),
                      );
                    });
              }
            ),
          ),
        ),
      ),
    );
  }
  runTts() async {
    print("run talker");
    setState(() {
      isTalking = true;
    });
    await tts.speak(AppLocalizations.of(context).translate("screen_size_button"));
    await tts.speak(AppLocalizations.of(context).translate("list_of_commands"));
    await tts.speak(AppLocalizations.of(context).translate("command1"));
    await tts.speak(AppLocalizations.of(context).translate("command1_info"));
    await tts.speak(AppLocalizations.of(context).translate("command2"));
    await tts.speak(AppLocalizations.of(context).translate("command2_info"));
    await tts.speak(AppLocalizations.of(context).translate("command3"));
    await tts.speak(AppLocalizations.of(context).translate("command3_info"));
    setState(() {
      isTalking = false;
    });
  }
}
