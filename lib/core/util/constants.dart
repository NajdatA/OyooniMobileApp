import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_tts/flutter_tts.dart';

///
///
/// The [Endpoints] class is a way to separate the API's endpoints and base url from the remote data sources classes
/// and put them in one easy to edit class
///
/// 1- static and const values which are:
///
/// * [Endpoints.BASE_URL] the base url of the backend system we are working with
///
///
///
class Endpoints {
  static const SOCKET_URL = 'https://192.168.1.66:5001/hub';
  static const BASE_URL = 'https://192.168.1.66:5001/api/';

  static const LOGIN_URL = 'accounts/login';
  static const SIGN_UP_URL = 'accounts/signup';
  static const REFRESH_TOKEN_URL = 'test';
  static const AVAILABLE_TIMES_URL = 'availableTimes';

  static const TEXT_RECOGNITION = 'ai/recognize-text';
  static const IMAGE_CAPTIONING = 'ai/caption-image';
  static const BANKNOTE_RECOGNITION = 'ai/recognize-banknote';
  static const COLOR_RECOGNITION = 'ai/recognize-color';
}

const OPEN_WEATHER_MAP_API_KEY = 'e6ae5a9cf2d4ece30cbbe6be87ed121b';
//live
const STRIPE_KEY_LIVE =
    "pk_live_51IS6MnH7P52N6GU6TzkEmgEm6gLpLrNx3cIYduZXXZOIAeOo1craxSMhjUClhEZ9KkcwLh8KNjsszR0BI6Wyp9vr00XRZlBPLX";
//test
const STRIPE_KEY_TEST =
    "pk_test_51IS6MnH7P52N6GU6b6mH1OMrq16kMdnNNCna6rxKQIbYHAroKpje0q7nixcXbdBOrqZGYV3evRVgvgCjrctE3fPv00d92zpM5o";
const MERCHANT_ID = "muslim_app";
const ANDROID_PAY_MODE = "production";
const SUPPORT_VALUES = [10, 25, 50, 75, 100];

///
/// The [ErrorCode] enum is responsible of stating all the possible issues that can be retrieved from the API
///
/// Values:
///
/// * [ErrorCode.SERVER_ERROR] indicates that the server returned an undefined error
/// * [ErrorCode.WRONG_INPUT] returned when the server returns error 422 UnProcessable Entity
/// * [ErrorCode.NO_INTERNET_CONNECTION] returned when the device is not connected to a network
/// * [ErrorCode.FORBIDDEN] returned when the server returns 403 Forbidden
/// * [ErrorCode.TIMEOUT] returned when the request has timed out
/// * [ErrorCode.UNAUTHENTICATED] returned when the request returns that the user is unauthenticated
///
///
enum ErrorCode {
  BAD_REQUEST, //                 * A bad request
  UNAUTHORIZED, //                * JWT Invalid or Refresh token invalid
  FORBIDDEN, //                   * No permission access
  NOT_FOUND, //                   * Endpoint not found
  DUPLICATED_ENTRY, //            * Duplication in input (record/value)
  VALIDATION_ERROR, //            * Input validation error (body/query/params) using express-sanitizer
  INVALID_OPERATION, //           * Trying to do something when the current state doesn't allow it (ex: terminate a terminated alarm)
  ITEM_NOT_FOUND, //              * Endpoint found but the requested resource isn't found
  INTERNAL_SERVER_ERROR, //       ! Server error
  SERVICE_UNAVAILABLE, //
  SERVER_ERROR,
  NO_INTERNET_CONNECTION,
  WRONG_INPUT
}

String errorTomsg(ErrorCode e) {
  switch (e) {
    case ErrorCode.BAD_REQUEST:
      return 'SomeThing Went Wrong'; //                 * A bad request
    case ErrorCode.UNAUTHORIZED:
      return 'please Login Or Register'; //                * JWT Invalid or Refresh token invalid
    case ErrorCode.FORBIDDEN:
      return 'SomeThing Went Wrong'; //                   * No permission access
    case ErrorCode.NOT_FOUND:
      return 'This Content does not exist'; //                   * Endpoint not found
    case ErrorCode.DUPLICATED_ENTRY:
      return 'an account with the same info was found'; //            * Duplication in input (record/value)
    case ErrorCode.VALIDATION_ERROR:
      return 'SomeThing Went Wrong'; //            * Input validation error (body/query/params) using express-sanitizer
    case ErrorCode.INVALID_OPERATION:
      return 'SomeThing Went Wrong'; //           * Trying to do something when the current state doesn't allow it (ex: terminate a terminated alarm)
    case ErrorCode.ITEM_NOT_FOUND:
      return 'This Content does not exist'; //              * Endpoint found but the requested resource isn't found
    case ErrorCode.INTERNAL_SERVER_ERROR:
      return 'SomeThing Went Wrong'; //       ! Server error
    case ErrorCode.SERVICE_UNAVAILABLE:
      return 'SomeThing Went Wrong'; //
    case ErrorCode.SERVER_ERROR:
      return 'SomeThing Went Wrong';
    case ErrorCode.NO_INTERNET_CONNECTION:
      return 'No Internet Connection';
    case ErrorCode.WRONG_INPUT:
      return 'Wrong Input';
    default:
      return 'SomeThing Went Wrong';
  }
}

class GetParams {
  static Map<String, dynamic> getLoginParams(String email, String password) {
    return {
      'email': email,
      'password': password,
    };
  }

  static Map<String, dynamic> getSignUpParams(String email, String first,
      String last, String password, String confirm) {
    return {
      'email': email,
      'firstName': first,
      'lastName': last,
      'password': password,
      'confirmPassword': confirm,
    };
  }
}

///
/// [GetOptions] class is for gathering all the options for the [Dio] package in one class
///
class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(
    String token, {
    String accept = 'application/json',
    // String contentType = 'application/json',
    String language = '',
  }) {
    options.headers = {
      'Accept-Language': language,
      'Accept': accept,
    }..addEntries([
        // if (contentType != null) MapEntry('Content-Type', contentType),
        if ((token ?? '').isNotEmpty) MapEntry('Authorization', 'Bearer $token')
      ]);
    return options;
  }
}

///
///
/// [AppLanguage] enum is declaring the supported languages in our app
///
enum AppLanguage {
  AR,
  EN,
}

///
///
/// [Unit] enum is declaring the current temp unit  of the  app
///
enum AppUnit {
  C,
  F,
}

class ServerEvents {
  static const connectedSuccessfully = 'ConnectedSuccessfully';
  static const receivedSignal = 'RecievedSignal';
  static const newVINeedingHelp = 'NewVINeedingHelp';
  static const error = 'Error';
  static const volunteerDisconnected = 'VolunteerDisconnected';
  static const viDisconnected = 'VisuallyImpaireDisconnected';
  static const alreadyInCall = 'AlreadyInACall';
  static const cancelledHelpRequest = 'CancelledHelpRequest';
  static const viAcceptedByVolunteer = 'VIAcceptedByVolunteer';
  static const volunteerHasHungUp = 'VolunteerHasHungup';
  static const viHasHungUp = 'VisuallyImpairedHasHungUp';
  static const volunteerAcceptedCall = 'VolunteerAcceptedCall';
}

class ServerMethods {
  static const requestVolunteerHelp = "RequestVolunteerHelp";
  static const acceptCall = "AcceptCall";
  static const hangUp = "Hangup";
  static const sendSignal = "SendSignal";
}

class Responses {
  static const viEndedCall = "تم إنهاء المكالمة";
}

BehaviorSubject<AppLanguage> languageSubject = BehaviorSubject();

void changeGlobalAppLanguage(AppLanguage language) {
  languageSubject.add(language);
}

runSpeech(List<String> sentences, FlutterTts tts) async {
  await tts.awaitSpeakCompletion(true);
  sentences.forEach((element) async {
    await tts.speak(element);
  });
  // await tts.speak(AppLocalizations.of(context).translate("screen_size_button"));
  // await tts.speak(AppLocalizations.of(context).translate("list_of_commands"));
  // await tts.speak(AppLocalizations.of(context).translate("command1"));
  // await tts.speak(AppLocalizations.of(context).translate("command1_info"));
  // await tts.speak(AppLocalizations.of(context).translate("command2"));
  // await tts.speak(AppLocalizations.of(context).translate("command2_info"));
}

BehaviorSubject<AppUnit> unitSubject = BehaviorSubject();

void changeUnit(AppUnit unit) {
  unitSubject.add(unit);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
