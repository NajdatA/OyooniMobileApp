import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:senior_project/core/util/light_theme_colors.dart';
import 'package:senior_project/core/util/theme_colors.dart';

///
///
/// [CustomTextField] class is the base [TextField] widget for all the text fields in the app
///
class CustomTextField extends StatelessWidget {
  // final ScreenUtil screenUtil = ScreenUtil();

  final double? height;
  final String? hintText;
  final Color? backgroundColor;
  final Color? hintColor;
  final Color? textColor;
  final double? radius;
  final double? hintFontSize;
  final double? textFontSize;
  final double? width;
  final double? marginTop;
  final double? marginBottom;
  final double? marginRight;
  final double? marginLeft;
  final double? textPaddingTop;
  final double? textPaddingBottom;
  final double? textPaddingRight;
  final double? textPaddingLeft;
  final bool? isDense;
  final bool? expands;
  final bool? alignLabelWithHint;
  final bool? readOnly;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final int? hintMaxLines;
  final int? textExpandedFlex;
  final int? iconExpandedFlex;
  final Function? onSubmitted;
  final Function(String)? onChanged;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final InputBorder? inputBorder;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final BoxConstraints? prefixIconConstraints;
  final FontWeight? hintWeight;
  final Widget? icon;
  final Widget? secondIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final BoxBorder? boxBorder;
  final Color? cursorColor;
  final Color? borderColor;
  final String? value;
  final bool? editable;

  CustomTextField(
      {Key? key,
      this.value,
      this.height = 80,
      this.hintText = "",
      this.backgroundColor,
      this.hintColor = LightThemeColors.lightTextColor,
      this.textColor = LightThemeColors.textColor,
      this.radius = 4,
      this.width,
      this.onSubmitted,
      this.onChanged,
      this.onTap,
      this.hintFontSize = 12,
      this.textFontSize = 12,
      this.marginTop = 0,
      this.marginBottom = 0,
      this.marginRight = 0,
      this.marginLeft = 0,
      this.textPaddingTop = 0,
      this.textPaddingBottom = 0,
      this.textPaddingRight = 16,
      this.textPaddingLeft = 16,
      this.isDense = true,
      this.expands = false,
      this.readOnly = false,
      this.obscureText = false,
      this.alignLabelWithHint,
      this.padding = EdgeInsets.zero,
      this.textAlignVertical,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.minLines,
      this.hintMaxLines = 1,
      this.textExpandedFlex = 1,
      this.iconExpandedFlex = 1,
      this.textDirection,
      this.textInputAction,
      this.keyboardType = TextInputType.text,
      this.inputBorder = InputBorder.none,
      this.controller,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.focusNode,
      this.hintWeight,
      this.icon,
      this.secondIcon,
      this.suffixIcon,
      this.inputFormatters,
      this.prefixIconConstraints,
      this.prefixIcon,
      this.boxBorder,
      this.cursorColor,
      this.borderColor,
      this.editable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (secondIcon == null)
      return Container(
        margin: EdgeInsets.only(
          top: marginTop!,
          bottom: marginBottom!,
          left: marginLeft!,
          right: marginRight!,
        ),
        padding: padding,
        height: (height),
        width: width == null ? null : (width),
        decoration: BoxDecoration(
          color: backgroundColor == null ? Colors.white : backgroundColor,
          borderRadius: BorderRadius.circular(radius!),
          border: Border.all(
            color: borderColor ?? ThemeColors.getPrimaryColor(context),
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).splashColor.withOpacity(0.06),
              blurRadius: 18,
              offset: Offset(3, 6),
            ),
          ],
        ),
        child: Center(
          child: TextFormField(
            enabled: editable ?? true,
            cursorColor: cursorColor,
            inputFormatters: inputFormatters!,
            obscureText: obscureText!,
            expands: expands!,
            readOnly: readOnly!,
            textAlignVertical: textAlignVertical,
            maxLines: maxLines,
            minLines: minLines,
            controller: controller,
            focusNode: focusNode,
            textAlign: textAlign!,
            textDirection: textDirection,
            initialValue: value ?? null,
            style: TextStyle(
                color: textColor, fontSize: (textFontSize)),
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            decoration: new InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixIconConstraints,
              icon: icon,
              suffixIcon: suffixIcon,
              isDense: isDense,
              hintMaxLines: hintMaxLines,
              hintText: hintText,
              alignLabelWithHint: alignLabelWithHint,
              contentPadding: EdgeInsets.only(
                top: (textPaddingTop!),
                bottom: (textPaddingBottom!),
                left: (textPaddingLeft!),
                right: (textPaddingRight!),
              ),
              hintStyle: TextStyle(
                color: hintColor,
                fontWeight: hintWeight,
                fontSize: (hintFontSize),
              ),
              border: inputBorder,
            ),
            onChanged: onChanged!,
            onTap: onTap!,
          ),
        ),
      );
    else
      return Container(
        margin: EdgeInsets.only(
            top: (marginTop!),
            bottom: (marginBottom!),
            left: (marginLeft!),
            right: (marginRight!)),
        padding: padding,
        height: (height),
        width: width == null ? null : (width),
        decoration: BoxDecoration(
            color: backgroundColor == null ? Colors.white : backgroundColor,
            borderRadius: BorderRadius.circular(radius!),
            border: boxBorder),
        child: Row(
          crossAxisAlignment: crossAxisAlignment!,
          children: [
            Expanded(
              flex: textExpandedFlex!,
              child: TextFormField(
                enabled: editable ?? true,
                textAlignVertical: textAlignVertical,
                maxLines: maxLines,
                expands: expands!,
                cursorHeight: (30),
                obscureText: obscureText!,
                readOnly: readOnly!,
                controller: controller,
                focusNode: focusNode,
                textAlign: textAlign!,
                textDirection: textDirection,
                style: TextStyle(
                    color: textColor, fontSize: (textFontSize)),
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                decoration: new InputDecoration(
                  suffixIcon: suffixIcon,
                  icon: icon,
                  prefixIcon: prefixIcon,
                  prefixIconConstraints: prefixIconConstraints,
                  isDense: isDense,
                  hintMaxLines: hintMaxLines,
                  hintText: hintText,
                  contentPadding: EdgeInsets.only(
                      top: (textPaddingTop!),
                      bottom: (textPaddingBottom!),
                      left: (textPaddingLeft!),
                      right: (textPaddingRight!)),
                  hintStyle: TextStyle(
                    color: hintColor,
                    fontWeight: hintWeight,
                    fontSize: (hintFontSize),
                  ),
                  border: inputBorder,
                ),
                onChanged: onChanged,
                onTap: onTap,
              ),
            ),
            Expanded(flex: iconExpandedFlex!, child: secondIcon!)
          ],
        ),
      );
  }
}
