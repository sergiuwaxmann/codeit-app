import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:codeitapp/utilities/size_config.dart';

class ProfileSettingsSquareButton extends StatelessWidget {
  double _calculateSize() {
    double sizeMultiplier = !SizeConfig.isTablet ? 0.1 : 0.05;
    return sizeMultiplier *
        (SizeConfig.isPortrait
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    double _size = _calculateSize();

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            Theme.of(context).brightness == Brightness.light
                ? BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                : BoxShadow(),
          ],
        ),
        child: Icon(
          Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings,
        ),
      ),
    );
  }
}
