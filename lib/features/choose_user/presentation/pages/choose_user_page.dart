import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project/core/util/generate_screen.dart';
import 'package:senior_project/features/choose_user/presentation/bloc/choose_user_bloc.dart';
import 'package:senior_project/features/choose_user/presentation/bloc/choose_user_state.dart';
import 'package:senior_project/injection.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChooseUserPage extends StatefulWidget {
  @override
  _ChooseUserState createState() => _ChooseUserState();
}

class _ChooseUserState extends State<ChooseUserPage> {
  final bloc = sl<ChooseUserBloc>();
  FlutterTts tts = FlutterTts();
  List<Color> borderColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];

  @override
  void initState() {
    tts.awaitSpeakCompletion(true);
    tts.setLanguage("en");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF222222),
      // backgroundColor: Color(0xFF111144),
      //   backgroundColor: Color(0xFFCCCCCC),
      backgroundColor: Color(0xFF313F58),
      body: BlocBuilder(
        cubit: bloc,
        builder: (context, ChooseUserState state) {
          return Stack(
            children: [
              // Positioned.fill(
              //   child: Image.asset(
              //     'assets/images/eyes.png',
              //     repeat: ImageRepeat.repeat,
              //     scale: 70,
              //     color: Colors.black.withOpacity(0.073),
              //   ),
              // ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          borderColors = [
                            Color(0xFFF6964C),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                          ];
                        });
                        tts.speak("هذا شعار التطبيق");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColors[0]),
                        ),
                        child: Image.asset('assets/images/oyooni_glasses.png', scale: 7,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            borderColors = [
                              Colors.transparent,
                              Color(0xFFF6964C),
                              Colors.transparent,
                              Colors.transparent,
                            ];
                          });
                          await tts.speak("هذه جملة تقول");
                          // Future.delayed(Duration(seconds: 2), () {
                          tts.speak(
                              "يرجى اختيار نوع المستخدم الذي تريد الإكمال به");
                          // });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColors[1])),
                          child: Text(
                            "يرجى اختيار نوع المستخدم الذي تريد الإكمال به!",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Color(0xFFF6964C),
                                shadows: [
                                  Shadow(
                                      color: Colors.white.withOpacity(0.4),
                                      offset: Offset(1, 1),
                                      blurRadius: 5)
//                             Shadow(color: Colors.black.withOpacity(0.3), offset: Offset(1,1), blurRadius: 5)
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () async {
                          // await tts.speak("انقر مرتين هنا لاختيار نوع المستخدم");
                          setState(() {
                            borderColors = [
                              Colors.transparent,
                              Colors.transparent,
                              Color(0xFFF6964C),
                              Colors.transparent,
                            ];
                          });
                          await tts.speak("نوع المستخدم كفيف");
                        },
                        onDoubleTap: () {
                          tts.speak(
                              "سيتم الآن نقلك إلى الصفحة الرئيسية على أنك كفيف");
                          bloc.user("blind");
                          Navigator.pushReplacementNamed(
                              context, NameScreen.HOME_PAGE);
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: Color(0xFFF6964C),
//                         color: Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFF6964C).withOpacity(0.8),
                                Color(0xFFF6964C).withOpacity(0.8),
                                Color(0xFFF6964C).withOpacity(0.9),
                                Color(0xFFF6964C)
                              ],
                              // colors: [Color(0xFF222288), Color(0xFF111166), Color(0xFF111155), Color(0xFF111144)],
//                           colors: [Color(0xFFFFFFFF), Color(0xFFEEEEEE), Color(0xFFDDDDDD), Color(0xFFBBBBBB)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 0.2, 0.4, 0.9],
                            ),
                            border: Border.all(color: borderColors[2]),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(-2,-2),
                                blurRadius: 5,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              // BoxShadow(
                              //   offset: Offset(-2,-3),
                              //   blurRadius: 5,
                              //   spreadRadius: 2,
                              //   color: Colors.white.withOpacity(0.3),
                              // ),
                              BoxShadow(
                                offset: Offset(2, 4),
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Color(0xFF111111).withOpacity(0.15),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(56),
                          child: Center(
                            child: Text(
                              'كفيف',
                              style: TextStyle(
                                color: Color(0xFFEEEEEE),
//                             color: Color(0xFF555555),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () async {
                          // await tts.speak("انقر مرتين هنا لاختيار نوع المستخدم");
                          setState(() {
                            borderColors = [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Color(0xFFF6964C),
                            ];
                          });
                          await tts.speak("نوع المستخدم متطوع");
                        },
                        onDoubleTap: () {
                          tts.speak(
                              "سيتم الآن نقلك إلى الصفحة الرئيسية على أنك متطوع");
                          bloc.user('volunteer');
                          Navigator.pushReplacementNamed(
                              context, NameScreen.LOGIN_PAGE);
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: Color(0xFF222222),
//                         color: Color(0xFFDDDDDD),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFF6964C).withOpacity(0.8),
                                Color(0xFFF6964C).withOpacity(0.8),
                                Color(0xFFF6964C).withOpacity(0.9),
                                Color(0xFFF6964C)
                              ],
                              // colors: [Color(0xFF222288), Color(0xFF111166), Color(0xFF111155), Color(0xFF111144)],
//                           colors: [Color(0xFFFFFFFF), Color(0xFFEEEEEE), Color(0xFFDDDDDD), Color(0xFFBBBBBB)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 0.2, 0.4, 0.9],
                            ),
                            border: Border.all(color: borderColors[3]),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(-2,-2),
                                blurRadius: 5,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              // BoxShadow(
                              //   offset: Offset(-2,-3),
                              //   blurRadius: 5,
                              //   spreadRadius: 2,
                              //   color: Colors.white.withOpacity(0.3),
                              // ),
                              BoxShadow(
                                offset: Offset(2, 4),
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: Color(0xFF111111).withOpacity(0.15),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(56),
                          child: Center(
                            child: Text(
                              'متطوع',
                              style: TextStyle(
                                color: Color(0xFFEEEEEE),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
