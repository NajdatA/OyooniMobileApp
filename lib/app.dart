import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:senior_project/core/util/app_localizations.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/core/util/custom_scroll_behavior.dart';
import 'package:senior_project/core/util/generate_screen.dart';

// import 'package:senior_project/feature/splash/presentation/bloc/choose_user_bloc.dart';
import 'package:senior_project/injection.dart';

import 'core/util/light_theme_colors.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // String? path;
    // ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS)
    //     .then((value) {
    //   print("value is ${value}");
    //   path = value;
    //   final file = File('${path!}/ipaddress.txt');
    //   file.readAsString().then((value) => print('file is $value'));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);

    return StreamBuilder<AppLanguage>(
      stream: languageSubject,
      builder: (context, snapshot) {
        print('snapshot data is ${snapshot.data}');
        return MaterialApp(
          locale: Locale(
              // snapshot.data == AppLanguage.AR ?
              'ar'
              // : 'en'
              ),
          theme: Theme.of(context).copyWith(
            backgroundColor: LightThemeColors.backgroundColor,
            textSelectionColor: LightThemeColors.textColor,
            scaffoldBackgroundColor: LightThemeColors.backgroundColor,
            primaryColor: LightThemeColors.primaryColor,
            accentColor: LightThemeColors.accentColors,
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: "Poppins",
                  displayColor: LightThemeColors.textColor,
                  bodyColor: LightThemeColors.lightTextColor,
                ),
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            // ScreenUtil.init(context, designSize: Size(412, 870));

            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: child!,
              ),
            );
          },
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          initialRoute: NameScreen.SPLASH_PAGE,
          onGenerateRoute: GenerateScreen.onGenerate,
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            //AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}
