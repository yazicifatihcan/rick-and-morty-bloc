import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../theme.dart';

class AppPrimaryTheme implements AppTheme {
  
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get backgroundColor => Colors.black;

  @override
  Color get scaffoldBackgroundColor => Colors.black;

  @override
  Color get cardColor => AppColors().cardColor;



  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: AppColors().darkText,
        primaryContainer: AppColors().darkText,
        secondary: AppColors().green,
        secondaryContainer: Colors.white,
        surface: AppColors().cardColor,
        background: AppColors().background,
        error: Colors.red,
        onPrimary: AppColors().yellow,
        onSecondary: AppColors().darkText,
        onSurface: Colors.white,
        onBackground: AppColors().darkText,
        onError: Colors.white,
        brightness: Brightness.dark,
        outline: AppColors().darkText,
      );


  @override
  TextTheme get textTheme => TextTheme(
        ///HeadLine
        headline1: TextStyle(
          fontSize: 12.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        headline2: TextStyle(
          fontSize: 13.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        headline3: TextStyle(
          fontSize: 18.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        headline4: TextStyle(
          fontSize: 15.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        headline5: TextStyle(
          fontSize: 20.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        headline6: TextStyle(
          fontSize: 26.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),

        ///BodyText
        bodyText1: TextStyle(
          fontSize: 16.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        bodyText2: TextStyle(
          fontSize: 10.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        subtitle1: TextStyle(
          fontSize: 14.horizontalScale,
          fontWeight: FontWeight.w500,
          color: AppColors().darkText,
        ),
        subtitle2: TextStyle(
          fontSize: 8.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
        caption: TextStyle(
          fontSize: 11.horizontalScale,
          fontWeight: FontWeight.w400,
          color: AppColors().darkText,
        ),
      );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(AppColors().darkText),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: AppColors().darkText,
              fontWeight: FontWeight.w400,
              fontSize: 16.horizontalScale,
            ),
          ),
        ),
      );







  


}
