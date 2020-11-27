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
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
  static final TextStyle _headlineeDark =
      _headlineLight.copyWith(color: Colors.white);

  static final TextStyle _bodyLight1 = TextStyle(
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
  static final TextStyle _bodyDark1 = _bodyLight1.copyWith(color: Colors.white);

  static final TextStyle _bodyLight2 =
      _bodyLight1.copyWith(color: Colors.black.withOpacity(0.8));
  static final TextStyle _bodyDark2 =
      _bodyLight1.copyWith(color: Colors.white.withOpacity(0.8));

  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headlineLight,
    bodyText1: _bodyLight1,
    bodyText2: _bodyLight2,
  );
  static final TextTheme darkTextTheme = TextTheme(
    headline1: _headlineeDark,
    bodyText1: _bodyDark1,
    bodyText2: _bodyDark2,
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
