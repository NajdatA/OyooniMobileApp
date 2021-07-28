import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:senior_project/features/camera/presentation/bloc/camera_state.dart';
import 'package:senior_project/injection.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final bloc = sl<CameraBloc>();
  CameraController? camera;
  Future<void>? _initializeCameraControllerFuture;
  int index = 4;
  stt.SpeechToText speech = stt.SpeechToText();
  FlutterTts tts = FlutterTts();

  @override
  void initState() {
    tts.setLanguage('ar');
    tts.awaitSpeakCompletion(true).then((value) => runTts());
    // cameras = availableCameras().then((value) {
    // speech.initialize(
    //     onStatus: (s) {
    //       print('status is $s');
    //     }, onError: (e) {
    //   print('e is $e');
    //   // sttListener();
    // });
    // sttListener();
    // camera = CameraController(
    //     CameraDescription(
    //         name: "0",
    //         lensDirection: CameraLensDirection.back,
    //         sensorOrientation: 90),
    //     ResolutionPreset.high);
    // camera.initialize();
    // });
    _initializeCamera();
    setState(() {});
    super.initState();
  }

  void _initializeCamera() async {
    CameraDescription cameraDescription =
        await getCamera(CameraLensDirection.back);

    camera = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );

    _initializeCameraControllerFuture =
        camera!.initialize().then((value) => setState(() {}));
    // _initializeCameraControllerFuture
    //     .then((_) => camera.startImageStream((CameraImage image) {
    //   Some Image Processing to be inserted.
    // }));
  }

  Future<CameraDescription> getCamera(CameraLensDirection direction) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == direction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeCameraControllerFuture,
        builder: (context, snapshot) {
          return camera == null || camera!.value == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : BlocListener(
                  listener: (context, CameraState state) async {
                    // while (state.isLoading) {
                    //   print("camera is loading");
                    //   await tts.speak("يرجى الانتظار");
                    // }
                    if (state.captionedImage != null) {
                      print("hahaha");
                      bloc.reset();
                      await tts.speak(state.captionedImage!);
                    }

                    if (state.recognizedBanknote != null) {
                      bloc.reset();
                      await tts.speak(state.recognizedBanknote!);
                    }

                    if (state.recognizedColor != null) {
                      bloc.reset();
                      await tts.speak(state.recognizedColor!);
                    }
                  },
                  bloc: bloc,
                  child: BlocBuilder(
                      bloc: bloc,
                      builder: (context, CameraState state) {
                        return Scaffold(
                          body: GestureDetector(
                            onDoubleTap: () async {
                              if (state.isLoading) {
                                await tts.speak("يرجى الانتظار");
                              } else {
                                final image = await camera!.takePicture();
                                if (index == 4)
                                  bloc.onImageCaptioning(image.path);
                                else if (index == 3) {
                                } else if (index == 2) {
                                } else if (index == 1)
                                  bloc.onBanknoteRecognition(image.path);
                                else if (index == 0)
                                  bloc.onColorRecognition(image.path);
                              }
                            },
                            onTap: () async {
                              if (state.isLoading) {
                                await tts.speak("يرجى الانتظار");
                              } else {
                                await tts.stop();
                                print('jajaja');
                                await speech.stop();
                                await speech.initialize(onStatus: (s) {
                                  print('status is $s');
                                }, onError: (e) {
                                  print('e is $e');
                                  // sttListener();
                                }).then((value) => speech.listen(
                                      onResult: (r) async {
                                        print('result is $r');
                                        if (r.recognizedWords == "ماذا ارى") {
                                          setState(() {
                                            index = 4;
                                          });
                                          await tts.speak("تم اختيار ماذا ارى");
                                        }
                                        if (r.recognizedWords == "نص" ||
                                            r.recognizedWords == "النص") {
                                          setState(() {
                                            index = 3;
                                          });
                                          await tts.speak("تم اختيار النص");
                                        }
                                        if (r.recognizedWords == "وثيقه" ||
                                            r.recognizedWords == "الوثيقه" ||
                                            r.recognizedWords == "وثيقة") {
                                          setState(() {
                                            index = 2;
                                          });
                                          await tts.speak("تم اختيار وثيقة");
                                        }
                                        if (r.recognizedWords == "نقود" ||
                                            r.recognizedWords == "النقود") {
                                          setState(() {
                                            index = 1;
                                          });
                                          await tts.speak("تم اختيار نقود");
                                        }
                                        if (r.recognizedWords == "الألوان" || r.recognizedWords == "الالوان" || r.recognizedWords == "ألوان" || r.recognizedWords == "الوان") {
                                          setState(() {
                                            index = 0;
                                          });
                                          await tts.speak("تم اختيار الألوان");
                                        }
                                      },
                                      localeId: "ar",
                                    ));
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: CameraPreview(
                                camera!,
                              ),
                            ),
                          ),
                          bottomNavigationBar: Theme(
                            data: ThemeData(
                              canvasColor: Color(0xFF313F58),
                            ),
                            child: BottomNavigationBar(
                              currentIndex: index,
                              backgroundColor: Color(0xFF313F58),
                              onTap: (int x) async {
                                if (state.isLoading) {
                                  await tts.speak("يرجى الانتظار");
                                } else {
                                  setState(() {
                                    index = x;
                                  });
                                  if (x == 4)
                                    await tts.speak("تم اختيار ماذا ارى");
                                  else if (x == 3)
                                    await tts.speak("تم اختيار النص");
                                  else if (x == 2)
                                    await tts.speak("تم اختيار الوثيقة");
                                  else if (x == 1)
                                    await tts.speak("تم اختيار نقود");
                                  else if (x == 0)
                                    await tts.speak("تم اختيار الألوان");
                                }
                              },
                              selectedItemColor: Color(0xFFF6964C),
                              unselectedItemColor:
                                  Color(0xFFF6964C).withOpacity(0.2),
                              selectedLabelStyle: TextStyle(
                                color: Color(0xFFF6964C),
                                fontSize: 12,
                              ),
                              items: [
                                BottomNavigationBarItem(
                                  icon: Container(
                                      child: Icon(Icons.color_lens_outlined)),
                                  label: "Color Detection",
                                ),
                                BottomNavigationBarItem(
                                  icon: Container(
                                      child: Icon(Icons.money_rounded)),
                                  label: "Banknote Detection",
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.file_copy_outlined),
                                  label: "Doc. Recognition",
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.short_text),
                                  label: "Text Recognition",
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.image_search),
                                  label: "Image Captioning",
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
        });
  }

  void sttListener() {
    speech.initialize(onStatus: (s) {
      print('status is $s');
    }, onError: (e) {
      print('e is $e');
      // sttListener();
    }).then((value) => speech.listen(
          onResult: (r) {
            print('result is $r');
          },
          localeId: "ar",
        ));
  }

  runTts() async {
    // "الكاميرا قيد العمل, يرجى استخدام أحد الأوامر التالية عند النقر على الشاشة:",
    // "ماذا أرى, للاستعلام على محتوى الصورة",
    // "نص, لاستعلام على محتوى نص",
    // "نقود, للاستعلام عن نوع العملة النقدية"
    await tts.speak(
        "الكاميرا قيد العمل, يرجى استخدام أحد الأوامر التالية عند النقر على الشاشة:");
    await tts.speak("ماذا أرى, للاستعلام على محتوى الصورة");
    await tts.speak("نص, لاستعلام على محتوى نص");
    await tts.speak("نقود, للاستعلام عن نوع العملة النقدية");
  }
}
