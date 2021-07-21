import 'package:rxdart/rxdart.dart';

var localeSubjectAppLanguage = BehaviorSubject<int>();

changeAppLanguage(int choice) {
  localeSubjectAppLanguage.sink.add(choice);
}

class AppLanguageKeys {
  static const english = 0;
  static const arabic = 1;
}
