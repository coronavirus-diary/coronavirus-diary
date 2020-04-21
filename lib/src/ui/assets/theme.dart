import 'package:flutter/material.dart';

ThemeData getTheme(
  ThemeData baseTheme, {
  Color primaryColor,
  Color accentColor,
  Color textColor,
  Color secondaryForegroundColor,
  Color backgroundColor,
}) {
  return baseTheme.copyWith(
    appBarTheme: AppBarTheme(
      color: primaryColor,
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: textColor),
      contentTextStyle: TextStyle(color: secondaryForegroundColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    backgroundColor: backgroundColor,
    accentColor: accentColor,
    iconTheme: baseTheme.iconTheme.copyWith(color: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: textColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(
          color: secondaryForegroundColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(
          color: secondaryForegroundColor.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(
          color: secondaryForegroundColor,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      errorStyle: TextStyle(
        color: textColor,
        fontSize: 16,
      ),
    ),
    textSelectionColor: accentColor,
    textSelectionHandleColor: accentColor,
    textTheme: baseTheme.textTheme,
    primaryTextTheme: baseTheme.primaryTextTheme,
    accentTextTheme: baseTheme.accentTextTheme,
    colorScheme: baseTheme.colorScheme.copyWith(
      primary: primaryColor,
      secondary: accentColor,
      background: backgroundColor,
    ),
    buttonTheme: baseTheme.buttonTheme.copyWith(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide.none,
      ),
    ),
  );
}

final ThemeData lightTheme = getTheme(
  ThemeData.light(),
  primaryColor: Color(0xff003a68),
  accentColor: Color(0xff00dfb7),
  textColor: Color(0xff003a68),
  secondaryForegroundColor: Color(0xff000000),
  backgroundColor: Color(0xffffffff),
);

final ThemeData darkTheme = getTheme(
  ThemeData.dark(),
  primaryColor: Color(0xffffffff),
  accentColor: Color(0xff00dfb7),
  textColor: Color(0xffffffff),
  secondaryForegroundColor: Color(0xffffffff),
  backgroundColor: Color(0xff003a68),
);
