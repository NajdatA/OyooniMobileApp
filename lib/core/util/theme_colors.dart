import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/util/light_theme_colors.dart';

///
///
/// [ThemeColors] class is responsible for matching between the theme colors and the app colors
///
class ThemeColors {

  static Color getAppBarColor(BuildContext context) =>
      Theme.of(context).bottomAppBarColor;

  static Color getBottomNavigationBarColor(BuildContext context) =>
      Theme.of(context).bottomAppBarColor;
static Color getCardTitleColor(BuildContext context) =>
      Theme.of(context).cardColor;

 static Color getAccentColor(BuildContext context) =>
      Theme.of(context).accentColor;

  static Color getSelectedBackgroundColor(BuildContext context) =>
      Theme.of(context).selectedRowColor;

  static Color getBackgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color getPrimaryColor(BuildContext context) =>
      Theme.of(context).primaryColor;

  static Color getDarkTextColor(BuildContext context) =>
      Theme.of(context).textTheme.headline1!.color!;

  static Color getLightTextColor(BuildContext context) =>
      Theme.of(context).textTheme.headline2!.color!;

  static Color getBottomNavigationBarIconColor(BuildContext context) =>
      Theme.of(context).hoverColor;

  static Color getAlertTextColor(BuildContext context) =>
      Theme.of(context).disabledColor;

  static Color getNameColor(BuildContext context) =>
      Theme.of(context).canvasColor;

  static Color getlightText(BuildContext context) =>
      LightThemeColors.lightTextColor;
  static Color getBorderYellow(BuildContext context) =>
      LightThemeColors.borderYellow;
  static Color gethintText(BuildContext context) =>
      LightThemeColors.hintText;
  static Color getbackTextField(BuildContext context) =>
      LightThemeColors.backTextField;

  static Color getLightBlueColor() => Color(0xff3AB5F9);
  static Color getLighterBlueColor() => Color(0xffD8F1FF);
  static Color getMoreLighterBlueColor() => Color(0xffD9F2FF);
  static Color getDarkGreyColor() => Color(0xffA8A8A8);
  static Color? getGrey300Color() => Colors.grey[300];
  static Color? getGrey600Color() => Colors.grey[600];
  static Color getLightGrayColor() => Color(0xffE7E7E7);
  static Color getMoreLightGrayColor() => Color(0xffd1d1d1);
  static Color? getGray400Color() => Colors.grey[400];
  static Color? getGrey400Color() => Colors.grey[400];
  static Color getGrayColor() => Colors.grey;
  static Color getTileColor() => Color(0xff35DBA3);
  static Color? getGray600Color() => Colors.grey[600];
  static Color getRedColor() => Colors.red;
  static Color getWhiteColor() => Colors.white;
  static Color getBlackColor() => Colors.black;
  static Color getBlueColor() => Colors.blue;
  static Color getGreenColor() => Colors.green;
  static Color? getGoldColor() => Colors.yellow[800];
  static Color? getBlueColorDark() => Colors.blue[700];

  static Color loginTextFieldColor() => Color(0xffEBEBEB);
  static Color loginHintColor() => Color(0xffA8A8A8);
  static Color getBlackGreyColor() => Color(0xff757575);
  static Color secondPrimaryColor() => Color(0xff002940);
  static Color clickableTextColor() => Color(0xff00A5FF);


  static Color backgroundTextFieldProfile()=>Color(0xffEBEBEB);
  static Color colorTextFiled()=>Color(0xff00527F);
  static Color buttonTextColor()=>Color(0xffFFFFFF);
  static Color cancelProfileButtonColor()=>Color(0xffA8A8A8);
  static Color dropDownButtonColor()=>Color(0xff9A9A9A);



  static Color zakatContainerColor()=>Color(0xff00527F);
  static Color zakatTextColor()=>Color(0xffFFFFFF);
  static Color zakatUlMalCalculatorBackgroundColor()=>Color(0xffF5F5F5);
  static Color zakatUlMalCalculatorText()=>Color(0xff9C9DA7);
  static Color zakatUlMalRequestBackgroundColor()=>Color(0xffFFEBB5);
  static Color zakatUlMalRequestText()=>Color(0xffFFBB01);
  static Color zakatUlMalPayBackgroundColor()=>Color(0xffBAE6FF);
  static Color zakatUlMalPayText()=>Color(0xff2FA9EB);

  static Color zakatCalculatorColor() => Color(0xffBAE6FF);
  static Color zakatCalculatorTextColor1() => Color(0xff757575);
  static Color zakatCalculatorTextColor2() => Color(0xff00A5FF);


}
