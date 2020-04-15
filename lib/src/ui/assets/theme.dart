import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xff003a68);
const Color _accentColor = Color(0xff00dfb7);
const Color _textColor = _primaryColor;

final ThemeData lightTheme = ThemeData.light().copyWith(
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
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide(
        color: Colors.black,
      ),
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

final ThemeData darkTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: Colors.white,
    background: lightTheme.colorScheme.primary,
  ),
  scaffoldBackgroundColor: lightTheme.colorScheme.primary,
  buttonTheme: lightTheme.buttonTheme.copyWith(
    buttonColor: lightTheme.accentColor,
  ),
  iconTheme: lightTheme.iconTheme.copyWith(
    color: Colors.white,
  ),
  textTheme: lightTheme.textTheme.copyWith(
    caption: lightTheme.textTheme.caption.copyWith(
      color: Colors.white,
    ),
    button: lightTheme.textTheme.button.copyWith(
      color: Colors.white,
    ),
    headline: lightTheme.textTheme.headline.copyWith(
      color: Colors.white,
    ),
    title: lightTheme.textTheme.title.copyWith(
      color: Colors.white,
    ),
    subhead: lightTheme.textTheme.subhead.copyWith(
      color: Colors.white,
    ),
    body1: lightTheme.textTheme.body1.copyWith(
      color: Colors.white,
    ),
    body2: lightTheme.textTheme.body2.copyWith(
      color: Colors.white,
    ),
    display1: lightTheme.textTheme.display1.copyWith(
      color: Colors.white,
    ),
    display2: lightTheme.textTheme.display2.copyWith(
      color: Colors.white,
    ),
    display3: lightTheme.textTheme.display3.copyWith(
      color: Colors.white,
    ),
    display4: lightTheme.textTheme.display4.copyWith(
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
    border: lightTheme.inputDecorationTheme.border.copyWith(
        borderSide: lightTheme.inputDecorationTheme.border.borderSide
            .copyWith(color: Colors.white)),
    enabledBorder: lightTheme.inputDecorationTheme.enabledBorder.copyWith(
        borderSide: lightTheme.inputDecorationTheme.enabledBorder.borderSide
            .copyWith(color: Colors.white.withOpacity(0.5))),
    focusedBorder: lightTheme.inputDecorationTheme.focusedBorder.copyWith(
        borderSide: lightTheme.inputDecorationTheme.focusedBorder.borderSide
            .copyWith(color: Colors.white)),
    focusColor: Colors.white,
    labelStyle: lightTheme.inputDecorationTheme.labelStyle.copyWith(
      color: Colors.white,
    ),
  ),
);
