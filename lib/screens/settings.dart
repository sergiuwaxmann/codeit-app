import 'package:flutter/material.dart';

import 'package:codeitapp/utilities/size_config.dart';

import 'package:codeitapp/widgets/change_theme_button.dart';
import 'package:codeitapp/widgets/header_navigation.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  double _calculateMargin() {
    return 0.05 *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _margin = _calculateMargin();

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              boxShadow: [
                Theme.of(context).brightness == Brightness.light
                    ? BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 12),
                        blurRadius: 32,
                      )
                    : BoxShadow(),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Container(
                padding: EdgeInsets.all(
                  _margin,
                ),
                child: HeaderNavigation(
                  title: 'Settings',
                ),
              ),
            ),
          ),
          SizedBox(
            height: _margin,
          ),
          ChangeThemeButton(),
        ],
      ),
    );
  }
}
