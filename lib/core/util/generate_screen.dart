import 'package:flutter/material.dart';
import 'package:senior_project/features/available_times/presentation/pages/available_times_page.dart';
import 'package:senior_project/features/call/presentation/pages/call_page.dart';
import 'package:senior_project/features/camera/presentation/pages/camera_page.dart';
import 'package:senior_project/features/choose_user/presentation/pages/choose_user_page.dart';
import 'package:senior_project/features/home/presentation/pages/home_page.dart';
import 'package:senior_project/features/login/presentation/pages/login_page.dart';
import 'package:senior_project/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:senior_project/features/splash/presentation/pages/splash_page.dart';
import 'package:senior_project/features/video_call/presentation/pages/video_call_page.dart';
import 'package:senior_project/features/volunteer_main/presentation/pages/volunteer_main_page.dart';

///
///
/// [GenerateScreen.onGenerate] function is responsible for returning the specific [Route] with the right data.
///

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name;
    print("the name is $name");
    final args = value.arguments;
    switch (name) {
      case NameScreen.SPLASH_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => SplashPage(),
            settings: value,
          );
        }
      case NameScreen.CHOOSE_USER_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => ChooseUserPage(),
            settings: value,
          );
        }
      case NameScreen.HOME_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: value,
          );
        }
      case NameScreen.CAMERA_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => CameraPage(),
            settings: value,
          );
        }
      case NameScreen.LOGIN_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => LoginPage(),
            settings: value,
          );
        }
      case NameScreen.CALL_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => CallPage(),
            settings: value,
          );
        }
      case NameScreen.VOLUNTEER_MAIN_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => VolunteerMainPage(),
            settings: value,
          );
        }
      case NameScreen.SIGNUP_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => SignUpPage(),
            settings: value,
          );
        }
      case NameScreen.AVAILABLE_TIMES_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => AvailableTimesPage(),
            settings: value,
          );
        }
      case NameScreen.VIDEO_CALL_PAGE:
        {
          if (args is Map<String, dynamic>) {
            return MaterialPageRoute(
              builder: (context) =>
                  VideoCallPage(id: args["id"]),
              settings: value,
            );
          }
          break;
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

///
/// [NameScreen] class is responsible for declaring the routing names
///
class NameScreen {
  static const String SPLASH_PAGE = "/s";
  static const String HOME_PAGE = "/home";
  static const String LOGIN_PAGE = "/login";
  static const String CHOOSE_USER_PAGE = "/chooseUser";
  static const String CAMERA_PAGE = "/camera";
  static const String CALL_PAGE = "/call";
  static const String VOLUNTEER_MAIN_PAGE = "/volunteerMain";
  static const String SIGNUP_PAGE = "/signUp";
  static const String AVAILABLE_TIMES_PAGE = "/availableTimes";
  static const String VIDEO_CALL_PAGE = "/videoCall";
}
