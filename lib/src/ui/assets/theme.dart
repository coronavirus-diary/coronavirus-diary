import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData.light().copyWith(
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
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
);
