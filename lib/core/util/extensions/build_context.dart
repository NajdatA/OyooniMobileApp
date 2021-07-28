// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../app_localizations.dart';
//
// extension BuildContextExtension on BuildContext {
//   // Locale stuff
//
//   AppLocalizations get locale => AppLocalizations.of(this);
//
//   String translate(String key) => locale.translate(key) ?? key;
//
//
//   // Media query stuff
//
//   MediaQueryData get mediaQuery => MediaQuery.of(this);
//
//   double get fullWidth => mediaQuery.size.width;
//   double get fullHeight => mediaQuery.size.height;
//
//   //Navigate stuff
//
//   NavigatorState get navigator => Navigator.of(this);
//
//   void pop<T extends Object>([T result]) => navigator.pop<T>(result);
//
//   void popUntil({numberOfPages = 1}) {
//     int count = 0;
//     navigator.popUntil((_) => count++ == numberOfPages);
//   }
//
//   Future<T> pushNamed<T extends Object>(
//       String routeName, {
//         Object arguments,
//       }) =>
//       navigator.pushNamed<T>(routeName, arguments: arguments);
//
//   Future<T> pushPage<T extends Object>(Widget widget) =>
//       navigator.push<T>(MaterialPageRoute(builder: (_) => widget));
//
//   Future<T> pushPageWithBloc<T extends Object, B extends bloc>(
//       Widget widget,
//       B bloc,
//       ) =>
//       navigator.push<T>(
//         MaterialPageRoute(
//           builder: (_) => BlocProvider.value(
//             value: bloc,
//             child: widget,
//           ),
//         ),
//       );
//
//   Future<T> cupertinoPushPage<T extends Object>(Widget widget) =>
//       navigator.push<T>(CupertinoPageRoute(builder: (_) => widget));
//
//   Future<T> pushNamedAndRemoveUntil<T extends Object>(
//       String newRouteName,
//       RoutePredicate predicate, {
//         Object arguments,
//       }) =>
//       navigator.pushNamedAndRemoveUntil<T>(
//         newRouteName,
//         predicate,
//         arguments: arguments,
//       );
// }
