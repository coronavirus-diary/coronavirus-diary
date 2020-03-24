import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xff143a65);
const Color _accentColor = Color(0xff5dcaab);
const Color _textColor = _primaryColor;

final ThemeData appTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    color: _primaryColor,
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(color: _textColor),
    contentTextStyle: TextStyle(color: Colors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: _primaryColor,
  backgroundColor: Colors.white,
  accentColor: _accentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(color: _primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: _textColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    errorStyle: TextStyle(
      color: _textColor,
      fontSize: 16,
    ),
  ),
  textSelectionColor: _accentColor,
  textSelectionHandleColor: _accentColor,
  textTheme: ThemeData.light().textTheme,
  primaryTextTheme: ThemeData.light().primaryTextTheme,
  accentTextTheme: ThemeData.light().accentTextTheme,
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: _primaryColor,
        secondary: _accentColor,
      ),
  buttonTheme: ThemeData.light().buttonTheme.copyWith(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        buttonColor: _primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide.none,
        ),
      ),
);
