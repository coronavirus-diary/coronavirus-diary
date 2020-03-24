import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    color: Colors.lightBlue,
//    color: Colors.red,
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(color: Colors.black),
    contentTextStyle: TextStyle(color: Colors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
  scaffoldBackgroundColor: Colors.blue,
  backgroundColor: Colors.white,
  accentColor: Colors.yellowAccent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(0.8),
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    errorStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
  textTheme: ThemeData.dark().textTheme,
  primaryTextTheme: ThemeData.dark().primaryTextTheme,
  accentTextTheme: ThemeData.dark().accentTextTheme,
  buttonTheme: ThemeData.dark().buttonTheme.copyWith(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        buttonColor: Colors.white.withOpacity(0.8),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none,
        ),
      ),
);
