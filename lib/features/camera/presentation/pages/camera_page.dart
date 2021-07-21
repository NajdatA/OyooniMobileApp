import 'dart:html';

import 'package:document_scanner/document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController camera;
  Future<void> _initializeCameraControllerFuture;
  int index = 2;
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

    _initializeCameraControllerFuture = camera.initialize().then((value) => setState(() {}));
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
        return
          camera == null || camera.value == null ? Center(child: CircularProgressIndicator(),) :
        Scaffold(
          body: GestureDetector(
            onDoubleTap: () async {
              final image = await camera.takePicture();
              
            },
            onTap: () async {
              await tts.stop();
              print('jajaja');
              await speech.stop();
              await speech.initialize(
                  onStatus: (s) {
                    print('status is $s');
                  }, onError: (e) {
                print('e is $e');
                // sttListener();
              }).then((value) => speech.listen(
                onResult: (r) async {
                  print('result is $r');
                  if (r.recognizedWords == "ماذا ارى") {
                    setState(() {
                      index = 2;
                    });
                    await tts.speak("تم اختيار ماذا ارى");
                  }
                  if (r.recognizedWords == "نص") {
                    setState(() {
                      index = 1;
                    });
                    await tts.speak("تم اختيار النص");
                  }
                  if (r.recognizedWords == "نقود") {
                    setState(() {
                      index = 0;
                    });
                    await tts.speak("تم اختيار نقود");
                  }
                },
                localeId: "ar",
              ));
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(
                camera,
                // child: Container(
                //   height: 500,
                //   width: 400,
                //   color: Colors.red,
                // ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            backgroundColor: Color(0xFF313F58),
            onTap: (int x) {
              setState(() {
                index = x;
              });
            },
            selectedItemColor: Color(0xFFF6964C),
            unselectedItemColor: Color(0xFFF6964C).withOpacity(0.2),
            selectedLabelStyle: TextStyle(color: Color(0xFFF6964C)),
            items: [
              BottomNavigationBarItem(
                icon: Container(child: Icon(Icons.money_rounded)),
                label: "Banknote Detection",
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
        );
      }
    );
  }
  void sttListener() {
    speech.initialize(
        onStatus: (s) {
          print('status is $s');
        }, onError: (e) {
      print('e is $e');
      // sttListener();
    }).then((value) => speech.listen(onResult: (r) {
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
    await tts.speak("الكاميرا قيد العمل, يرجى استخدام أحد الأوامر التالية عند النقر على الشاشة:");
    await tts.speak("ماذا أرى, للاستعلام على محتوى الصورة");
    await tts.speak("نص, لاستعلام على محتوى نص");
    await tts.speak("نقود, للاستعلام عن نوع العملة النقدية");
  }
}