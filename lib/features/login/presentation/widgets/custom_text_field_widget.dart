import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool? obscureText;
  final Function(String)? onChanged;

  const CustomTextFieldWidget({Key? key, this.hint, this.controller, this.obscureText=false, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged!,
      obscureText: obscureText!,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        hintText: hint,
        filled: true,
        fillColor: Color(0xFFF6964C),
        hintStyle: TextStyle(
          color: Color(0xFF313F58),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFF313F58),
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.orange,
            )),
      ),
    );
  }
}
