import 'dart:io';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _accentColor = Color(0xFF0971FE);

  static const Color _primaryColorLight = Color(0xFFF1F4FB);
  static const Color _highlightColorLight = Color(0xFFF5F8FF);

  static const Color _primaryColorDark = Color(0xFF1B1B1B);
  static const Color _highlightColorDark = Color(0xFF282828);

  static final TextStyle _headlineLight = TextStyle(
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w800,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
  static final TextStyle _headlineeDark =
      _headlineLight.copyWith(color: Colors.white);

  static final TextStyle _bodyLight = TextStyle(
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
  static final TextStyle _bodyDark = _bodyLight.copyWith(color: Colors.white);

  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headlineLight,
    bodyText1: _bodyLight,
  );
  static final TextTheme darkTextTheme = TextTheme(
    headline1: _headlineeDark,
    bodyText1: _bodyDark,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: _accentColor,
    primaryColor: _primaryColorLight,
    highlightColor: _highlightColorLight,
    textTheme: lightTextTheme,
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: _accentColor,
    primaryColor: _primaryColorDark,
    highlightColor: _highlightColorDark,
    textTheme: darkTextTheme,
  );
}
