import 'package:flutter/cupertino.dart';

///
///
/// [CustomScrollBehavior] is a class for removing the animation for over-scrolling in Android platform
///
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}