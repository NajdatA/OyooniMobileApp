import 'package:flutter/material.dart';

class SignUpError extends StatelessWidget {
  // final ScreenUtil screenUtil = ScreenUtil();

  final String title;

  SignUpError({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5.0, right: 20),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.red,
              fontSize: 10),
        ),
      ),
    );
  }
}
