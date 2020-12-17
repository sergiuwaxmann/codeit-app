import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:codeitapp/providers/theme_notifier.dart';

import 'package:codeitapp/utilities/app_theme.dart';
import 'package:codeitapp/utilities/size_config.dart';

class ChangeThemeButton extends StatefulWidget {
  @override
  _ChangeThemeButtonState createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  var _darkTheme = false;

  void _onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(AppTheme.darkTheme)
        : themeNotifier.setTheme(AppTheme.lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    final _themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (_themeNotifier.getTheme() == AppTheme.darkTheme);

    return SafeArea(
      top: false,
      bottom: false,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _darkTheme = !_darkTheme;
          });
          _onThemeChanged(_darkTheme, _themeNotifier);
        },
        child: Container(
          width: double.infinity,
          height: (!SizeConfig.isTablet ? 0.15 : 0.1) *
              (SizeConfig.isPortrait
                  ? SizeConfig.screenWidth
                  : SizeConfig.screenHeight),
          margin: EdgeInsets.symmetric(
            horizontal: 0.05 *
                (SizeConfig.isPortrait
                    ? SizeConfig.screenWidth
                    : SizeConfig.screenHeight),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF73A0F4),
                Color(0xFF4A47F5),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Switch to ' + (!_darkTheme ? 'Dark Theme' : 'Light Theme'),
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 1.8 * SizeConfig.textMultiplier,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
