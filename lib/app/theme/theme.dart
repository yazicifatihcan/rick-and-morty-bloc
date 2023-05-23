import 'package:flutter/material.dart';

abstract class AppTheme {
  Brightness get brightness;

  Color get backgroundColor;

  Color get scaffoldBackgroundColor;

  Color get cardColor;


  ColorScheme get colorScheme;

  TextTheme get textTheme;

  TextButtonThemeData get textButtonThemeData;
}

ThemeData getTheme<T extends AppTheme>(T theme) => ThemeData(
      colorScheme: theme.colorScheme,
      backgroundColor: theme.backgroundColor,
      scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
      cardColor: theme.cardColor,
      textTheme: theme.textTheme,
      brightness: theme.brightness,
      textButtonTheme: theme.textButtonThemeData

    );
